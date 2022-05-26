package com.example.cn.vx.demo.entity;

import java.io.Serializable;

public class TranList implements Serializable {
    private Integer tranId;

    private Integer userId;

    private String tranDate;

    private String tranTime;

    private String tranType;

    private String tranSeq;

    private String hostCode;

    private String hostMsg;

    private String hostIp;

    private String createTime;

    private String updateTime;

    private static final long serialVersionUID = 1L;

    public Integer getTranId() {
        return tranId;
    }

    public void setTranId(Integer tranId) {
        this.tranId = tranId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTranDate() {
        return tranDate;
    }

    public void setTranDate(String tranDate) {
        this.tranDate = tranDate == null ? null : tranDate.trim();
    }

    public String getTranTime() {
        return tranTime;
    }

    public void setTranTime(String tranTime) {
        this.tranTime = tranTime == null ? null : tranTime.trim();
    }

    public String getTranType() {
        return tranType;
    }

    public void setTranType(String tranType) {
        this.tranType = tranType == null ? null : tranType.trim();
    }

    public String getTranSeq() {
        return tranSeq;
    }

    public void setTranSeq(String tranSeq) {
        this.tranSeq = tranSeq == null ? null : tranSeq.trim();
    }

    public String getHostCode() {
        return hostCode;
    }

    public void setHostCode(String hostCode) {
        this.hostCode = hostCode == null ? null : hostCode.trim();
    }

    public String getHostMsg() {
        return hostMsg;
    }

    public void setHostMsg(String hostMsg) {
        this.hostMsg = hostMsg == null ? null : hostMsg.trim();
    }

    public String getHostIp() {
        return hostIp;
    }

    public void setHostIp(String hostIp) {
        this.hostIp = hostIp == null ? null : hostIp.trim();
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
        sb.append(", tranId=").append(tranId);
        sb.append(", userId=").append(userId);
        sb.append(", tranDate=").append(tranDate);
        sb.append(", tranTime=").append(tranTime);
        sb.append(", tranType=").append(tranType);
        sb.append(", tranSeq=").append(tranSeq);
        sb.append(", hostCode=").append(hostCode);
        sb.append(", hostMsg=").append(hostMsg);
        sb.append(", hostIp=").append(hostIp);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}