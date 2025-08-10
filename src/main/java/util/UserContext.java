package util;

import javax.servlet.http.HttpServletRequest;

public class UserContext {
    private static final ThreadLocal<String> currentUser = new ThreadLocal<>();

    public static void setCurrentUser(HttpServletRequest request) {
        String user = request.getRemoteUser();
        if (user == null) {
            user = "anonymous";
        }
        currentUser.set(user);
    }

    public static String getCurrentUser() {
        return currentUser.get();
    }

    public static void clear() {
        currentUser.remove();
    }
}
