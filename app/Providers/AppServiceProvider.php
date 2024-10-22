<?php

namespace App\Providers;

use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View::composer([
            'posts.index',
            'posts.edit',
            'posts.create',
            'posts.show',
        ], function ($view) {
            $view
                ->with('all_locales', config('app.all_locales'))
                ->with('current_locale', config('app.locale'));
        });
    }
}
