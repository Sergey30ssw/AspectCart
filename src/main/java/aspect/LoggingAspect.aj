package aspect;

import model.Cart;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import util.UserContext;

@Aspect
public class LoggingAspect {

    @Before("execution(* model.Cart.addProduct(..)) && args(id, name, price)")
    public void logBeforeAdd(JoinPoint joinPoint, String id, String name, double price) {
        System.out.printf("[LOG] User '%s' is adding product: %s - %s (%.2f)%n",
                UserContext.getCurrentUser(), name, id, price);
    }

    @After("execution(* model.Cart.addProduct(..)) && args(id, name, price)")
    public void logAfterAdd(JoinPoint joinPoint, String id, String name, double price) {
        System.out.printf("[LOG] Product %s successfully added by user '%s'%n",
                id, UserContext.getCurrentUser());
    }

    @Before("execution(* model.Cart.removeProduct(..)) && args(id)")
    public void logBeforeRemove(JoinPoint joinPoint, String id) {
        System.out.printf("[LOG] User '%s' is removing product: %s%n",
                UserContext.getCurrentUser(), id);
    }

    @After("execution(* model.Cart.removeProduct(..)) && args(id)")
    public void logAfterRemove(JoinPoint joinPoint, String id) {
        System.out.printf("[LOG] Product %s successfully removed by user '%s'%n",
                id, UserContext.getCurrentUser());
    }
}