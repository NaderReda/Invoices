<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use Spatie\Permission\Models\Role;

class AssignRoleToUser extends Command
{
    protected $signature = 'user:assign-role {email} {role}';
    protected $description = 'Assign a role to a user';

    public function handle()
    {
        $email = $this->argument('email');
        $roleName = $this->argument('role');
        
        $user = User::where('email', $email)->first();
        
        if (!$user) {
            $this->error("User with email {$email} not found!");
            return;
        }

        $role = Role::where('name', $roleName)->first();
        
        if (!$role) {
            $this->error("Role '{$roleName}' not found!");
            $this->info("Available roles:");
            $roles = Role::all();
            foreach ($roles as $r) {
                $this->line("  - {$r->name}");
            }
            return;
        }

        $user->assignRole($role);
        $this->info("Role '{$roleName}' assigned to {$user->name} successfully!");
        
        // Clear cache
        $this->call('cache:clear');
        $this->call('config:clear');
        $this->info("Cache cleared!");
    }
}
