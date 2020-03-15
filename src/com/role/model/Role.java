
package com.role.model;

public class Role {

    private Integer role_id;
    private String role_name;

    public Integer getRole_id() {
        return role_id;
    }

    /**
     * 设置  字段:role.role_id
     *
     * @param role_id  role.role_id
     */
    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    /**
     * 获取  字段:role.role_name
     *
     * @return  role.role_name
     */
    public String getRole_name() {
        return role_name;
    }

    /**
     * 设置  字段:role.role_name
     *
     * @param role_name  role.role_name
     */
    public void setRole_name(String role_name) {
        this.role_name = role_name == null ? null : role_name.trim();
    }
}