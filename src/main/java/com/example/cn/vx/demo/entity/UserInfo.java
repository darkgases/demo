package com.example.cn.vx.demo.entity;

import com.example.cn.vx.demo.common.enums.UserInfoState;

import java.io.Serializable;

public class UserInfo implements Serializable {
    private Integer userId;

    private Integer userRoleId;

    private String userAccount;

    private String userPhone;

    private String userPassword;

    private String userName;

    private String userAge;

    private String userSex;

    private String userOpenid;

    private String userState;

    private String userStateMsg;

    private String userInfoState;

    private String passwordErrTime;

    private String createTime;

    private String updateTime;

    private static final long serialVersionUID = 1L;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(Integer userRoleId) {
        this.userRoleId = userRoleId;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount == null ? null : userAccount.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserAge() {
        return userAge;
    }

    public void setUserAge(String userAge) {
        this.userAge = userAge == null ? null : userAge.trim();
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex == null ? null : userSex.trim();
    }

    public String getUserOpenid() {
        return userOpenid;
    }

    public void setUserOpenid(String userOpenid) {
        this.userOpenid = userOpenid == null ? null : userOpenid.trim();
    }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState == null ? null : userState.trim();
    }

    public String getUserStateMsg() {
        return userStateMsg;
    }

    public void setUserStateMsg(String userStateMsg) {
        this.userStateMsg = userStateMsg == null ? null : userStateMsg.trim();
    }

    public String getUserInfoState() {
        return userInfoState;
    }

    public void setUserInfoState(String userInfoState) {
        this.userInfoState = userInfoState == null ? null : userInfoState.trim();
    }

    public String getPasswordErrTime() {
        return passwordErrTime;
    }

    public void setPasswordErrTime(String passwordErrTime) {
        this.passwordErrTime = passwordErrTime == null ? null : passwordErrTime.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime == null ? null : updateTime.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userId=").append(userId);
        sb.append(", userRoleId=").append(userRoleId);
        sb.append(", userAccount=").append(userAccount);
        sb.append(", userPhone=").append(userPhone);
        sb.append(", userPassword=").append(userPassword);
        sb.append(", userName=").append(userName);
        sb.append(", userAge=").append(userAge);
        sb.append(", userSex=").append(userSex);
        sb.append(", userOpenid=").append(userOpenid);
        sb.append(", userState=").append(userState);
        sb.append(", userStateMsg=").append(userStateMsg);
        sb.append(", userInfoState=").append(userInfoState);
        sb.append(", passwordErrTime=").append(passwordErrTime);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    /**
     * 检查用户信息完整度
     */
    public String checkInfoState(UserInfo userInfo) {
        String userInfoState = UserInfoState.valueOf("NO_FULL").getInfoState();
        if (userInfo.getUserPhone()!=null &&
                userInfo.getUserAge()!=null &&
                userInfo.getUserName()!=null &&
                userInfo.getUserSex()!= null
        ){
            userInfoState = UserInfoState.valueOf("FULL").getInfoState();
        }
        return userInfoState;
    }
}
