require_relative "config/environment"

use Rack::MethodOverride

use ArtistsController
use InstitutionsController
use ApplicationsController

run ApplicationController