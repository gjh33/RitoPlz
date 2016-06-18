module RitoPlz
  module API
    class BadRequestException < StandardError
      def initialize
        msg = %{
400 (BAD REQUEST)
This error indicates that there is a syntax error in the request and the request has therefore been denied. The client should not continue to make similar requests without modifying the syntax or the requests being made.

Common Reasons:
  > A provided parameter was in the wrong format
  > A required parameter was not provided

This one is likely our fault, file a bug report
        }

        super(msg)
      end
    end

    class UnauthorizedException < StandardError
      def initialize
        msg = %{
401 (UNAUTHORIZED)
This error indicates that your api key was not authorized for the request you tried to make

Common Reason:
  > Make sure you configured your api key before making the request
  > Make sure you entered your api key correctly when you configured
  > Make sure your api key has access to the request you want to make
        }

        super(msg)
      end
    end

    class ForbiddenException < StandardError
      def initialize
        msg = %{
403 (FORBIDDEN)
This error indicates that you are forbidden to access this request

Common Reason:
  > Make sure you configured your api key before making the request
        }

        super(msg)
      end
    end

    class NotFoundException < StandardError
      def initialize
        msg = %{
404 (NOT FOUND)
This error indicates that the server failed to recognize your api request

Common Reason:
  > You're looking for an ID that doesn't exist
        }

        super(msg)
      end
    end

    class UnsupportedMediaTypeException < StandardError
      def initialize
        msg = %{
415 (UNSUPPORTED MEDIA TYPE)
This error indicates that the body of the request was not in a recognizable format

Common Reason:
  > We fucked up
  > You're trying to modify our code and you fucked up
        }

        super(msg)
      end
    end

    class RateLimitExceededException < StandardError
      def initialize
        msg = %{
429 (RATE LIMIT EXCEEDED)
This error indicates you've went over your rate limit. Check your api access rates on Riot's API page.

Common Reason:
  > Calm down there big boy, easy on the requests
        }

        super(msg)
      end
    end

    class InternalServerException < StandardError
      def initialize
        msg = %{
500 (INTERNAL SERVER ERROR)
This error indicates that Riot fucked up. This one's my favorite.

Common Reason:
  > Spaghetti code
        }

        super(msg)
      end
    end

    class ServiceUnavailableException < StandardError
      def initialize
        msg = %{
503 (SERVICE UNAVAILABLE)
This error indicates that Riot's server is unavailable

Common Reason:
  > You live in EUW
  > r/dota launched a mass ddos attack
  > Dyrus tried to use the microwave in the server room
        }

        super(msg)
      end
    end
  end
end
