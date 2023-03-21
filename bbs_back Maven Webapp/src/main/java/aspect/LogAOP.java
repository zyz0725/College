package aspect;

import java.lang.reflect.Method;
import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import annotation.Log;
import entity.LogMessage;
import entity.Manager;

public class LogAOP implements MethodInterceptor {
    private LogMessageService logMessageService;

    public LogMessageService getLogMessageService() {
        return logMessageService;
    }

    @Autowired
    public void setLogMessageService(LogMessageService logMessageService) {
        this.logMessageService = logMessageService;
    }

    public Object invoke(MethodInvocation methodInvocation) throws Throwable {
        Object proceed = null;
        //做了什么事
        Method method = methodInvocation.getMethod();
        Log annotation = method.getAnnotation(Log.class);
        if (annotation == null) {
            proceed = methodInvocation.proceed();
            return proceed;
        } else {
            String desc = annotation.desc();
            System.out.println(desc);
            //用户相关信息
        /*从session中获取当前管理员信息
        * ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        * Object user = requestAttributes.getRequest().getSession().getAttribute("user");
        */
            //Manager manager = new Manager("zyz", "951207","是");
            ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            Manager manager = (Manager) requestAttributes.getRequest().getSession().getAttribute("manager");
            System.out.println("==================登录的管理员是："+manager+"==================");
            LogMessage logMessage = new LogMessage();
            logMessage.setOperation(desc);
            logMessage.setTime(new Date());
            logMessage.setUsername(manager.getManager_name());
            try {
                //继续执行
                proceed = methodInvocation.proceed();
                //存库
                logMessageService.addNewLog(logMessage);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return proceed;
        }
    }
}
