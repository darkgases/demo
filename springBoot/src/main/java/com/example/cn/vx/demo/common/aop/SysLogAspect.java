package com.example.cn.vx.demo.common.aop;

import com.example.cn.vx.demo.common.ReturnCode;
import com.example.cn.vx.demo.common.ReturnMsg;
import com.example.cn.vx.demo.common.ServiceCommonInput;
import com.example.cn.vx.demo.common.ServiceCommonOutput;
import com.example.cn.vx.demo.common.until.CommonUtil;
import com.example.cn.vx.demo.entity.TranList;
import com.example.cn.vx.demo.entity.UserInfo;
import com.example.cn.vx.demo.service.log.SysLogService;
import com.example.cn.vx.demo.service.user.api.LoginImplOutput;
import com.example.cn.vx.demo.service.user.api.UserAddImplOutput;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * 系统日志：切面处理类
 */
@Aspect
@Component
public class SysLogAspect {

    @Autowired
    private SysLogService sysLogService;

    private String tranSeq;

    private static final Logger logger = LoggerFactory.getLogger(SysLogAspect.class);

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     *  定义切点 @Pointcut
     *  在注解的位置切入代码
     */
    @Pointcut("@annotation(com.example.cn.vx.demo.common.aop.MyLog)")
    public void logPoinCut() {
    }

    /**
     *  切面：controller方法执行前插入日志
     */
    @Before("execution(* com.example.cn.vx.demo.controller.*.*(..))")
    public void insertSysLog(JoinPoint joinPoint) {
        logger.info("切面(Before-begin)");
        //保存日志
        TranList sysLog = new TranList();
        Date now = new Date();
        this.tranSeq = CommonUtil.getTranSeq();
        if (tranSeq!=null && tranSeq !=""){
            String tranDate = tranSeq.substring(0,8);
            String tranTime = tranSeq.substring(8,14);
            sysLog.setTranSeq(tranSeq);
            sysLog.setTranDate(tranDate);
            sysLog.setTranTime(tranTime);
        }
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获取切入点所在的方法
        Method method = signature.getMethod();
        //获取操作
        MyLog myLog = method.getAnnotation(MyLog.class);
        if (myLog != null) {
            String value = myLog.value();
            sysLog.setTranType(value);//保存获取的操作
        }

        //获取请求的类名
//        String className = joinPoint.getTarget().getClass().getName();
        //获取请求的方法名
//        String methodName = method.getName();
//        sysLog.setTranType(className + "." + methodName);

        //请求的参数
        Object[] args = joinPoint.getArgs();
        // 将参数所在的数组转换成json
        Object[] arguments = new Object[args.length];
        for (int i = 0; i < args.length; i++) {
            arguments[i] = args[i];
            Map<String, String[]> linkMap = ((StandardMultipartHttpServletRequest) args[0]).getParameterMap();
            if (linkMap.size()>0){
                for (Map.Entry<String,String[]> entry : linkMap.entrySet()){
                    if ("userId".equals(entry.getKey()) && entry.getValue()[0]!=null && !("").equals(entry.getValue()[0])){
                        sysLog.setUserId(Integer.valueOf(entry.getValue()[0]));
                    }
                    if ("hostIp".equals(entry.getKey())){
                        sysLog.setHostIp((entry.getValue()[0]));
                    }
                }
            }
        }
        sysLog.setCreateTime(sdf.format(now));
        sysLogService.save(sysLog);
        logger.info("切面(Before-over)");
    }

    /**
     *  切面：正常返回后执行 更新日志
     */
    @AfterReturning(value = "logPoinCut()",returning = "returnValue")
    public void updateSysLog(JoinPoint joinPoint,Object returnValue) {
        logger.info("切面(AfterReturning-begin)");
        TranList sysLog = new TranList();
        //从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获取切入点所在的方法
        Method method = signature.getMethod();
        String methodName = method.getName();
        //登陆/注册交易无法上送userId，需要从返回中获取；
        if ("login".equals(methodName)){
            UserInfo userInfo = ((LoginImplOutput)returnValue).getUserInfo();
            if (userInfo != null){
                sysLog.setUserId(userInfo.getUserId());
            }
        }
        if ("userAdd".equals(methodName)){
            UserInfo userInfo = ((UserAddImplOutput)returnValue).getUserInfo();
            if (userInfo != null){
                sysLog.setUserId(userInfo.getUserId());
            }
        }
        sysLog.setHostCode(((ServiceCommonOutput) returnValue).getCode());
        sysLog.setHostMsg(((ServiceCommonOutput) returnValue).getMsg());

        Date now = new Date();
        sysLog.setUpdateTime(sdf.format(now));
        sysLog.setTranSeq(tranSeq);
        //调用service保存SysLog实体类到数据库
        sysLogService.update(sysLog);
        logger.info("切面(AfterReturning-over)");
    }

    @AfterThrowing(value = "logPoinCut()",throwing="ex")
    public void updateSysLogByThrow(JoinPoint joinPoint, Exception ex){
        logger.info("切面(AfterThrowing-begin)");
        TranList sysLog = new TranList();
        String name = joinPoint.getSignature().getName();
        logger.info(name + "异常：" + "\t" + ex.getMessage());
        Date now = new Date();
        sysLog.setUpdateTime(sdf.format(now));
        sysLog.setTranSeq(tranSeq);
        sysLog.setHostCode(ReturnCode.SystemErr);
        sysLog.setHostMsg(ReturnMsg.SystemErr+":"+ex.getMessage());
        sysLogService.update(sysLog);
        logger.info("切面(AfterThrowing-over)");
    }


}
