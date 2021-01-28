<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Carbon;

use App\Models\Subscription;

class UpdateSubscription extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'info:updatesubscription';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check for the subscription status using the expiry date and update accordingly';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $deleteNotifications = Subscription::where('expires_at', '<=', Carbon::now()->format('Y-m-d H:i:s'))->update([
            'status' => "expired"
        ]);
    }
}
