require_relative "./config/environment"

use Rack::MethodOverride

use SessionsController
use ArtistsController
use ApplicationsController

run ApplicationController