<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class SetupUserRole extends Command
{
    protected $signature = 'user:setup-role {email}';
    protected $description = 'Create owner role with all permissions and assign to user';

    public function handle()
    {
        $email = $this->argument('email');
        $user = User::where('email', $email)->first();
        
        if (!$user) {
            $this->error("User with email {$email} not found!");
            return;
        }

        // Check if owner role exists
        $role = Role::where('name', 'owner')->first();
        
        if (!$role) {
            $this->info("Creating 'owner' role...");
            $role = Role::create(['name' => 'owner']);
            $this->info("Role 'owner' created successfully!");
        } else {
            $this->info("Role 'owner' already exists.");
        }

        // Get all permissions
        $permissions = Permission::all();
        
        if ($permissions->count() == 0) {
            $this->warn("No permissions found in database!");
            $this->info("You may need to run: php artisan db:seed --class=CreateAdminUserSeeder");
            return;
        }

        // Sync all permissions to owner role
        $this->info("Syncing " . $permissions->count() . " permissions to 'owner' role...");
        $role->syncPermissions($permissions);
        $this->info("Permissions synced successfully!");

        // Assign role to user
        if (!$user->hasRole('owner')) {
            $user->assignRole('owner');
            $this->info("Role 'owner' assigned to {$user->name} successfully!");
        } else {
            $this->info("User already has 'owner' role.");
        }

        // Clear cache
        $this->call('cache:clear');
        $this->call('config:clear');
        $this->call('view:clear');
        $this->info("Cache cleared!");
        
        $this->line("");
        $this->info("Setup completed! Please log out and log back in.");
    }
}
