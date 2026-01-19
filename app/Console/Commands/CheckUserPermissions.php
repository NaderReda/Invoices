<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class CheckUserPermissions extends Command
{
    protected $signature = 'user:check {email}';
    protected $description = 'Check user roles and permissions';

    public function handle()
    {
        $email = $this->argument('email');
        $user = User::where('email', $email)->first();

        if (!$user) {
            $this->error("User with email {$email} not found!");
            return;
        }

        $this->info("User: {$user->name} ({$user->email})");
        $this->line("");

        // Check roles
        $roles = $user->roles;
        $this->info("Roles (" . $roles->count() . "):");
        if ($roles->count() > 0) {
            foreach ($roles as $role) {
                $this->line("  - {$role->name}");
            }
        } else {
            $this->warn("  No roles assigned!");
        }
        $this->line("");

        // Check permissions
        $permissions = $user->getAllPermissions();
        $this->info("Permissions (" . $permissions->count() . "):");
        if ($permissions->count() > 0) {
            foreach ($permissions as $permission) {
                $this->line("  - {$permission->name}");
            }
        } else {
            $this->warn("  No permissions assigned!");
        }
        $this->line("");

        // Check specific sidebar permissions
        $sidebarPermissions = ['الفواتير', 'التقارير', 'المستخدمين', 'الاعدادات'];
        $this->info("Sidebar Permissions Check:");
        foreach ($sidebarPermissions as $perm) {
            $has = $user->can($perm);
            $status = $has ? "✓" : "✗";
            $this->line("  {$status} {$perm}");
        }
    }
}
