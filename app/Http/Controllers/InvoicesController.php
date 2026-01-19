<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Notification;
use App\Models\invoices;
use App\Models\sections;


use App\Models\User;
use App\Models\invoices_details;
use App\Models\invoice_attachments;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Notifications\AddInvoice;
use App\Exports\InvoicesExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Events\MyEventClass;
class InvoicesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {


        $invoices = invoices::all();
        return view('invoices.invoices', compact('invoices'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $sections = sections::all();
        return view('invoices.add_invoice', compact('sections'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        invoices::create([
            'invoice_number' => $request->invoice_number,
            'invoice_date' => $request->invoice_date,
            'due_date' => $request->due_date,
            'product' => $request->product,
            'section_id' => $request->section,
            'amount_collection' => $request->amount_collection,
            'amount_commission' => $request->amount_commission,
            'discount' => $request->discount,
            'value_vat' => $request->value_vat,
            'rate_vat' => $request->rate_vat,
            'total' => $request->total,
            'status' => 'غير مدفوعة',
            'value_status' => 2,
            'note' => $request->note,
        ]);

        $invoice_id = invoices::latest()->first()->id;
        invoices_details::create([
            'id_invoice' => $invoice_id,
            'invoice_number' => $request->invoice_number,
            'product' => $request->product,
            'section' => $request->section,
            'status' => 'غير مدفوعة',
            'value_status' => 2,
            'note' => $request->note,
            'user' => (Auth::user()->name),
        ]);

        if ($request->hasFile('pic')) {

            $invoice_id = Invoices::latest()->first()->id;
            $image = $request->file('pic');
            $file_name = $image->getClientOriginalName();
            $invoice_number = $request->invoice_number;

            $attachments = new invoice_attachments();
            $attachments->file_name = $file_name;
            $attachments->invoice_number = $invoice_number;
            $attachments->Created_by = Auth::user()->name;
            $attachments->invoice_id = $invoice_id;
            $attachments->save();

            // move pic
            $imageName = $request->pic->getClientOriginalName();
            $request->pic->move(public_path('Attachments/' . $invoice_number), $imageName);
        }


           // $user = User::first();
           // Notification::send($user, new AddInvoice($invoice_id));

        $user = User::get();// هنا انا بقوله ابعت الاشعار لكل اللي مسجلين
        //$user = User::find(Auth::user()->id); // هنا بقوله ابعت الاشعار للي عمله
        $invoices = invoices::latest()->first();
        Notification::send($user, new \App\Notifications\Add_invoice_new($invoices));







        event(new MyEventClass('hello world'));

        session()->flash('Add', 'تم اضافة الفاتورة بنجاح');
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $invoices = invoices::where('id', $id)->first();
        return view('invoices.status_update', compact('invoices'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $invoices = invoices::where('id', $id)->first();
        $sections = sections::all();
        return view('invoices.edit_invoice', compact('sections', 'invoices'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {

        $invoices = invoices::findOrFail($request->invoice_id);
        $invoices->update([
            'invoice_number' => $request->invoice_number,
            'invoice_date' => $request->invoice_date,
            'due_date' => $request->due_date,
            'product' => $request->product,
            'section_id' => $request->section,
            'amount_collection' => $request->amount_collection,
            'amount_commission' => $request->amount_commission,
            'discount' => $request->discount,
            'value_vat' => $request->value_vat,
            'rate_vat' => $request->rate_vat,
            'total' => $request->total,
            'note' => $request->note,
        ]);

        session()->flash('edit', 'تم تعديل الفاتورة بنجاح');
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->invoice_id;
        $invoices = invoices::where('id', $id)->first();
        $Details = invoice_attachments::where('invoice_id', $id)->first();

         $id_page =$request->id_page;


        if (!$id_page==2) {

        if (!empty($Details->invoice_number)) {

            Storage::disk('public_uploads')->deleteDirectory($Details->invoice_number);
        }

        $invoices->forceDelete();
        session()->flash('delete_invoice');
        return redirect('/invoices');

        }

        else {

            $invoices->delete();
            session()->flash('archive_invoice');
            return redirect('/Archive');
        }


    }
    public function getproducts($id)
    {
        $products = DB::table("products")->where("section_id", $id)->pluck("Product_name", "id");
        return json_encode($products);
    }


    public function Status_Update($id, Request $request)
    {
        $invoices = invoices::findOrFail($id);

        if ($request->status === 'مدفوعة') {

            $invoices->update([
                'value_status' => 1,
                'status' => 'مدفوعة',
                'Payment_date' => $request->Payment_date,
            ]);

            invoices_Details::create([
                'id_invoice' => $request->invoice_id,
                'invoice_number' => $request->invoice_number,
                'product' => $request->product,
                'section' => $request->section,
                'status' => 'مدفوعة',
                'value_status' => 1,
                'note' => $request->note,
                'Payment_date' => $request->Payment_date,
                'user' => (Auth::user()->name),
            ]);
        }

        else {
            $invoices->update([
                'value_status' => 3,
                'status' => 'مدفوعة جزئيا',
                'Payment_date' => $request->Payment_date,
            ]);
            invoices_Details::create([
                'id_invoice' => $request->invoice_id,
                'invoice_number' => $request->invoice_number,
                'product' => $request->product,
                'section' => $request->section,
                'status' => 'مدفوعة جزئيا',
                'value_status' => 3,
                'note' => $request->note,
                'Payment_date' => $request->Payment_date,
                'user' => (Auth::user()->name),
            ]);
        }
        session()->flash('Status_Update');
        return redirect('/invoices');

    }


     public function Invoice_Paid()
    {
        $invoices = Invoices::where('value_status', 1)->get();
        return view('invoices.invoices_paid',compact('invoices'));
    }

    public function Invoice_unPaid()
    {
        $invoices = Invoices::where('value_status',2)->get();
        return view('invoices.invoices_unpaid',compact('invoices'));
    }

    public function Invoice_Partial()
    {
        $invoices = Invoices::where('value_status',3)->get();
        return view('invoices.invoices_Partial',compact('invoices'));
    }

    public function Print_invoice($id)
    {
        $invoices = invoices::where('id', $id)->first();
        return view('invoices.Print_invoice',compact('invoices'));
    }

    public function export()
    {

        return Excel::download(new InvoicesExport, 'invoices.xlsx');

    }


    public function MarkAsRead_all (Request $request)
    {

        $userUnreadNotification= auth()->user()->unreadNotifications;

        if($userUnreadNotification) {
            $userUnreadNotification->markAsRead();
            return back();
        }


    }


    public function unreadNotifications_count()

    {
        return auth()->user()->unreadNotifications->count();
    }

    public function unreadNotifications()

    {
        foreach (auth()->user()->unreadNotifications as $notification){

return $notification->data['title'];

        }

    }




}
