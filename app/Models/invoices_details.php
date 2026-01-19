<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class invoices_details extends Model
{
    protected $fillable = [
        'id_invoice',
        'invoice_number',
        'product',
        'section',
        'status',
        'value_status',
        'note',
        'user',
        'Payment_date',
    ];

}
