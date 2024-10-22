<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Category::create([
            'name' => 'Web Design'
        ]);
        Category::create([
            'name' => 'Online Marketing'
        ]);
        Category::create([
            'name' => 'Web development'
        ]);
        Category::create([
            'name' => 'Android Development'
        ]);
        Category::create([
            'name' => 'IOS Development'
        ]);
    }
}
