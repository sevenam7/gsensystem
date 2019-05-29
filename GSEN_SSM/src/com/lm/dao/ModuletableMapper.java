package com.lm.dao;

import java.util.List;

import com.lm.po.Moduletable;

/**
 * 模块表
 *
 */
public interface ModuletableMapper {
	/*
	 * 查询模块   insert
	 */
    List<Moduletable> selectModule();
    /**
     *  查询模块 update
     * @param usertypeId
     * @return
     */
    List<Moduletable> selectModule_up(int usertypeId);
}