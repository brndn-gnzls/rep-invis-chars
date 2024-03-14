import functools

# Decorator
def make_secure(func):
    @functools.wraps(func)
    def secure_function(*args, **kwargs):
        if args and args[0] == "admin":
            return func(*args, **kwargs)
        else:
            return f"[-] No admin permissions for this operation."
    return secure_function

@make_secure
def get_admin_password(panel) -> str:
    if panel == "admin":
        return "1234"
    elif panel == "billing":
        return "super_secure_password"

# Example usage
print(get_admin_password("admin"))
print(get_admin_password("billing"))