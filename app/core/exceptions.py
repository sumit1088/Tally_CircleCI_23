class ResourceNotFoundError(Exception):
    """Raised when a requested resource is not found."""
    pass

class ValidationError(Exception):
    """Raised when there is a validation error."""
    pass

class AuthenticationError(Exception):
    """Raised when there is an authentication error."""
    pass

class AuthorizationError(Exception):
    """Raised when there is an authorization error."""
    pass 