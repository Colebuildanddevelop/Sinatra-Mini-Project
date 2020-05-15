require_relative './config/environment'

use Rack::MethodOverride
use FightersController
use SessionsController
use GymsController
run ApplicationController
