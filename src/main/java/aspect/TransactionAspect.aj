package aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class TransactionAspect {

    @Around("execution(* model.Cart.addProduct(..)) || execution(* model.Cart.removeProduct(..))")
    public Object manageTransaction(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println("[TRANSACTION] Starting transaction for: " + joinPoint.getSignature().getName());

        try {
            Object result = joinPoint.proceed();
            System.out.println("[TRANSACTION] Transaction committed successfully");
            return result;
        } catch (Exception e) {
            System.out.println("[TRANSACTION] Transaction rolled back due to: " + e.getMessage());
            throw e;
        }
    }
}