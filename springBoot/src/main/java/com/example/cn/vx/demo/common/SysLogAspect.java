package com.example.cn.vx.demo.common;

import com.example.cn.vx.demo.entity.TranList;
import com.example.cn.vx.demo.entity.UserInfo;
import com.example.cn.vx.demo.service.log.SysLogService;
import com.example.cn.vx.demo.service.user.api.LoginImplOutput;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
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

    //定义切点 @Pointcut
    //在注解的位置切入代码
    @Pointcut("@annotation(com.example.cn.vx.demo.common.MyLog)")
    public void logPoinCut() {
    }

    //切面 配置通知
    @AfterReturning(value = "logPoinCut()",returning = "returnValue")
    public void saveSysLog(JoinPoint joinPoint,Object returnValue) {
        System.out.println("切面。。。。。");
        //保存日志
        TranList sysLog = new TranList();
        //从切面织入点处通过反射机制获取织入点处的方法
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
        String methodName = method.getName();
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
                    if ("userId".equals(entry.getKey()) && entry.getValue()[0]!=null){
                        sysLog.setUserId(Integer.valueOf(entry.getValue()[0]));
                    }
                    if ("hostIp".equals(entry.getKey())){
                        sysLog.setHostIp((entry.getValue()[0]));
                    }
                }
            }
        }

//登陆交易无法上送userId，需要从返回中获取；
        sysLog.setTranDate(String.valueOf(new Date()));
        if ("login".equals(methodName)){
            UserInfo userInfo = ((LoginImplOutput)returnValue).getUserInfo();
            if (userInfo != null){
                sysLog.setUserId(userInfo.getUserId());
            }
        }
        String tranSeq = ((ServiceCommonOutput) returnValue).getTranSeq();
        if (tranSeq!=null && tranSeq !=""){
            String tranDate = tranSeq.substring(0,8);
            String tranTime = tranSeq.substring(8,14);
            sysLog.setTranSeq(tranSeq);
            sysLog.setTranDate(tranDate);
            sysLog.setTranTime(tranTime);
        }
        sysLog.setHostCode(((ServiceCommonOutput) returnValue).getCode());
        sysLog.setHostMsg(((ServiceCommonOutput) returnValue).getMsg());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        sysLog.setCreateTime(sdf.format(now));
        sysLog.setUpdateTime(sdf.format(now));

        //调用service保存SysLog实体类到数据库
        sysLogService.save(sysLog);
    }

}
