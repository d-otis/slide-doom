require_relative "config/environment"

use Rack::MethodOverride

use SessionsController
use ArtistsController
use InstitutionsController
use ApplicationsController

run ApplicationController