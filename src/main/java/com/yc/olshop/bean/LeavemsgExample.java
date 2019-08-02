package com.yc.olshop.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LeavemsgExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public LeavemsgExample() {
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

        public Criteria andLmIdIsNull() {
            addCriterion("`lm_id` is null");
            return (Criteria) this;
        }

        public Criteria andLmIdIsNotNull() {
            addCriterion("`lm_id` is not null");
            return (Criteria) this;
        }

        public Criteria andLmIdEqualTo(Integer value) {
            addCriterion("`lm_id` =", value, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdNotEqualTo(Integer value) {
            addCriterion("`lm_id` <>", value, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdGreaterThan(Integer value) {
            addCriterion("`lm_id` >", value, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("`lm_id` >=", value, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdLessThan(Integer value) {
            addCriterion("`lm_id` <", value, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdLessThanOrEqualTo(Integer value) {
            addCriterion("`lm_id` <=", value, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdIn(List<Integer> values) {
            addCriterion("`lm_id` in", values, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdNotIn(List<Integer> values) {
            addCriterion("`lm_id` not in", values, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdBetween(Integer value1, Integer value2) {
            addCriterion("`lm_id` between", value1, value2, "lmId");
            return (Criteria) this;
        }

        public Criteria andLmIdNotBetween(Integer value1, Integer value2) {
            addCriterion("`lm_id` not between", value1, value2, "lmId");
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

        public Criteria andLmContentIsNull() {
            addCriterion("`lm_content` is null");
            return (Criteria) this;
        }

        public Criteria andLmContentIsNotNull() {
            addCriterion("`lm_content` is not null");
            return (Criteria) this;
        }

        public Criteria andLmContentEqualTo(String value) {
            addCriterion("`lm_content` =", value, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentNotEqualTo(String value) {
            addCriterion("`lm_content` <>", value, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentGreaterThan(String value) {
            addCriterion("`lm_content` >", value, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentGreaterThanOrEqualTo(String value) {
            addCriterion("`lm_content` >=", value, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentLessThan(String value) {
            addCriterion("`lm_content` <", value, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentLessThanOrEqualTo(String value) {
            addCriterion("`lm_content` <=", value, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentLike(String value) {
            addCriterion("`lm_content` like", value, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentNotLike(String value) {
            addCriterion("`lm_content` not like", value, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentIn(List<String> values) {
            addCriterion("`lm_content` in", values, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentNotIn(List<String> values) {
            addCriterion("`lm_content` not in", values, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentBetween(String value1, String value2) {
            addCriterion("`lm_content` between", value1, value2, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmContentNotBetween(String value1, String value2) {
            addCriterion("`lm_content` not between", value1, value2, "lmContent");
            return (Criteria) this;
        }

        public Criteria andLmTimeIsNull() {
            addCriterion("`lm_time` is null");
            return (Criteria) this;
        }

        public Criteria andLmTimeIsNotNull() {
            addCriterion("`lm_time` is not null");
            return (Criteria) this;
        }

        public Criteria andLmTimeEqualTo(Date value) {
            addCriterion("`lm_time` =", value, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeNotEqualTo(Date value) {
            addCriterion("`lm_time` <>", value, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeGreaterThan(Date value) {
            addCriterion("`lm_time` >", value, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("`lm_time` >=", value, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeLessThan(Date value) {
            addCriterion("`lm_time` <", value, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeLessThanOrEqualTo(Date value) {
            addCriterion("`lm_time` <=", value, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeIn(List<Date> values) {
            addCriterion("`lm_time` in", values, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeNotIn(List<Date> values) {
            addCriterion("`lm_time` not in", values, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeBetween(Date value1, Date value2) {
            addCriterion("`lm_time` between", value1, value2, "lmTime");
            return (Criteria) this;
        }

        public Criteria andLmTimeNotBetween(Date value1, Date value2) {
            addCriterion("`lm_time` not between", value1, value2, "lmTime");
            return (Criteria) this;
        }

        public Criteria andStateIsNull() {
            addCriterion("`state` is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("`state` is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(Integer value) {
            addCriterion("`state` =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(Integer value) {
            addCriterion("`state` <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(Integer value) {
            addCriterion("`state` >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("`state` >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(Integer value) {
            addCriterion("`state` <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(Integer value) {
            addCriterion("`state` <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<Integer> values) {
            addCriterion("`state` in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<Integer> values) {
            addCriterion("`state` not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(Integer value1, Integer value2) {
            addCriterion("`state` between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(Integer value1, Integer value2) {
            addCriterion("`state` not between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andLmReplyIsNull() {
            addCriterion("`lm_reply` is null");
            return (Criteria) this;
        }

        public Criteria andLmReplyIsNotNull() {
            addCriterion("`lm_reply` is not null");
            return (Criteria) this;
        }

        public Criteria andLmReplyEqualTo(String value) {
            addCriterion("`lm_reply` =", value, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyNotEqualTo(String value) {
            addCriterion("`lm_reply` <>", value, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyGreaterThan(String value) {
            addCriterion("`lm_reply` >", value, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyGreaterThanOrEqualTo(String value) {
            addCriterion("`lm_reply` >=", value, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyLessThan(String value) {
            addCriterion("`lm_reply` <", value, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyLessThanOrEqualTo(String value) {
            addCriterion("`lm_reply` <=", value, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyLike(String value) {
            addCriterion("`lm_reply` like", value, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyNotLike(String value) {
            addCriterion("`lm_reply` not like", value, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyIn(List<String> values) {
            addCriterion("`lm_reply` in", values, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyNotIn(List<String> values) {
            addCriterion("`lm_reply` not in", values, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyBetween(String value1, String value2) {
            addCriterion("`lm_reply` between", value1, value2, "lmReply");
            return (Criteria) this;
        }

        public Criteria andLmReplyNotBetween(String value1, String value2) {
            addCriterion("`lm_reply` not between", value1, value2, "lmReply");
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