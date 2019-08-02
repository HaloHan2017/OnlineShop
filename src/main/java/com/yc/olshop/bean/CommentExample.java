package com.yc.olshop.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CommentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CommentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCommIdIsNull() {
            addCriterion("`comm_id` is null");
            return (Criteria) this;
        }

        public Criteria andCommIdIsNotNull() {
            addCriterion("`comm_id` is not null");
            return (Criteria) this;
        }

        public Criteria andCommIdEqualTo(Integer value) {
            addCriterion("`comm_id` =", value, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdNotEqualTo(Integer value) {
            addCriterion("`comm_id` <>", value, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdGreaterThan(Integer value) {
            addCriterion("`comm_id` >", value, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("`comm_id` >=", value, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdLessThan(Integer value) {
            addCriterion("`comm_id` <", value, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdLessThanOrEqualTo(Integer value) {
            addCriterion("`comm_id` <=", value, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdIn(List<Integer> values) {
            addCriterion("`comm_id` in", values, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdNotIn(List<Integer> values) {
            addCriterion("`comm_id` not in", values, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdBetween(Integer value1, Integer value2) {
            addCriterion("`comm_id` between", value1, value2, "commId");
            return (Criteria) this;
        }

        public Criteria andCommIdNotBetween(Integer value1, Integer value2) {
            addCriterion("`comm_id` not between", value1, value2, "commId");
            return (Criteria) this;
        }

        public Criteria andPidIsNull() {
            addCriterion("`pid` is null");
            return (Criteria) this;
        }

        public Criteria andPidIsNotNull() {
            addCriterion("`pid` is not null");
            return (Criteria) this;
        }

        public Criteria andPidEqualTo(Integer value) {
            addCriterion("`pid` =", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotEqualTo(Integer value) {
            addCriterion("`pid` <>", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThan(Integer value) {
            addCriterion("`pid` >", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThanOrEqualTo(Integer value) {
            addCriterion("`pid` >=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThan(Integer value) {
            addCriterion("`pid` <", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThanOrEqualTo(Integer value) {
            addCriterion("`pid` <=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidIn(List<Integer> values) {
            addCriterion("`pid` in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotIn(List<Integer> values) {
            addCriterion("`pid` not in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidBetween(Integer value1, Integer value2) {
            addCriterion("`pid` between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotBetween(Integer value1, Integer value2) {
            addCriterion("`pid` not between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andUidIsNull() {
            addCriterion("`uid` is null");
            return (Criteria) this;
        }

        public Criteria andUidIsNotNull() {
            addCriterion("`uid` is not null");
            return (Criteria) this;
        }

        public Criteria andUidEqualTo(Integer value) {
            addCriterion("`uid` =", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotEqualTo(Integer value) {
            addCriterion("`uid` <>", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThan(Integer value) {
            addCriterion("`uid` >", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThanOrEqualTo(Integer value) {
            addCriterion("`uid` >=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThan(Integer value) {
            addCriterion("`uid` <", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThanOrEqualTo(Integer value) {
            addCriterion("`uid` <=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidIn(List<Integer> values) {
            addCriterion("`uid` in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotIn(List<Integer> values) {
            addCriterion("`uid` not in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidBetween(Integer value1, Integer value2) {
            addCriterion("`uid` between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotBetween(Integer value1, Integer value2) {
            addCriterion("`uid` not between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andCommTimeIsNull() {
            addCriterion("`comm_time` is null");
            return (Criteria) this;
        }

        public Criteria andCommTimeIsNotNull() {
            addCriterion("`comm_time` is not null");
            return (Criteria) this;
        }

        public Criteria andCommTimeEqualTo(Date value) {
            addCriterion("`comm_time` =", value, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeNotEqualTo(Date value) {
            addCriterion("`comm_time` <>", value, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeGreaterThan(Date value) {
            addCriterion("`comm_time` >", value, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("`comm_time` >=", value, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeLessThan(Date value) {
            addCriterion("`comm_time` <", value, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeLessThanOrEqualTo(Date value) {
            addCriterion("`comm_time` <=", value, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeIn(List<Date> values) {
            addCriterion("`comm_time` in", values, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeNotIn(List<Date> values) {
            addCriterion("`comm_time` not in", values, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeBetween(Date value1, Date value2) {
            addCriterion("`comm_time` between", value1, value2, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommTimeNotBetween(Date value1, Date value2) {
            addCriterion("`comm_time` not between", value1, value2, "commTime");
            return (Criteria) this;
        }

        public Criteria andCommStarsIsNull() {
            addCriterion("`comm_stars` is null");
            return (Criteria) this;
        }

        public Criteria andCommStarsIsNotNull() {
            addCriterion("`comm_stars` is not null");
            return (Criteria) this;
        }

        public Criteria andCommStarsEqualTo(Integer value) {
            addCriterion("`comm_stars` =", value, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsNotEqualTo(Integer value) {
            addCriterion("`comm_stars` <>", value, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsGreaterThan(Integer value) {
            addCriterion("`comm_stars` >", value, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsGreaterThanOrEqualTo(Integer value) {
            addCriterion("`comm_stars` >=", value, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsLessThan(Integer value) {
            addCriterion("`comm_stars` <", value, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsLessThanOrEqualTo(Integer value) {
            addCriterion("`comm_stars` <=", value, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsIn(List<Integer> values) {
            addCriterion("`comm_stars` in", values, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsNotIn(List<Integer> values) {
            addCriterion("`comm_stars` not in", values, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsBetween(Integer value1, Integer value2) {
            addCriterion("`comm_stars` between", value1, value2, "commStars");
            return (Criteria) this;
        }

        public Criteria andCommStarsNotBetween(Integer value1, Integer value2) {
            addCriterion("`comm_stars` not between", value1, value2, "commStars");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}