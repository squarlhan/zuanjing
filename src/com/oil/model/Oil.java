
package com.oil.model;


public class Oil {

    @Override
	public String toString() {
		return "Oil [time=" + time + ", dateTime=" + dateTime + ", wellDepth=" + wellDepth + ", hangDownDeep="
				+ hangDownDeep + ", depthOfTheDrillBit=" + depthOfTheDrillBit + ", drillDownDeep=" + drillDownDeep
				+ ", drillingTime=" + drillingTime + ", bitPressure=" + bitPressure + ", hangingLoad=" + hangingLoad
				+ ", rotationRate=" + rotationRate + ", torque=" + torque + ", kellyDown=" + kellyDown
				+ ", hookPosition=" + hookPosition + ", hookSpeed=" + hookSpeed + ", standpipePressureLog="
				+ standpipePressureLog + ", casingPressure=" + casingPressure + ", pumpStroke1=" + pumpStroke1
				+ ", pumpStroke2=" + pumpStroke2 + ", pumpStroke3=" + pumpStroke3 + ", totalPoolSize=" + totalPoolSize
				+ ", layTime=" + layTime + ", mudSpill=" + mudSpill + ", inletFlowlog=" + inletFlowlog
				+ ", outletFlowlog=" + outletFlowlog + ", inletDensitylog=" + inletDensitylog + ", outletDensitylog="
				+ outletDensitylog + ", entranceTempreture=" + entranceTempreture + ", exitTempreture=" + exitTempreture
				+ ", totalHydrocarbon=" + totalHydrocarbon + ", h2S=" + h2S + ", c1=" + c1 + ", c2=" + c2
				+ ", PWDHangDownDeep=" + PWDHangDownDeep + ", PWDAnnularPressure=" + PWDAnnularPressure
				+ ", PWDWellDeviation=" + PWDWellDeviation + ", PWDLocation=" + PWDLocation + ", upturnDepth="
				+ upturnDepth + ", operatorSchema=" + operatorSchema + ", standpipePressure=" + standpipePressure
				+ ", measurementOfBackPressure=" + measurementOfBackPressure + ", outletFlow=" + outletFlow
				+ ", outletDensity=" + outletDensity + ", backPressurePumpFlow=" + backPressurePumpFlow
				+ ", loopBackPressure=" + loopBackPressure + ", additionalBackPressure=" + additionalBackPressure
				+ ", inletFlow=" + inletFlow + ", fixDepth=" + fixDepth + ", fixPointDownDeep=" + fixPointDownDeep
				+ ", fixPointPressure=" + fixPointPressure + ", wellMouthAdjustment=" + wellMouthAdjustment
				+ ", fixPointPressureLoss=" + fixPointPressureLoss + ", fixPointECD=" + fixPointECD + ", drillECD="
				+ drillECD + ", drillStringPressureDrop=" + drillStringPressureDrop + ", drillBitPressureDrop="
				+ drillBitPressureDrop + ", environmentalControlPressureLoss=" + environmentalControlPressureLoss
				+ ", targetBackPressure=" + targetBackPressure + ", hydrostaticPressure=" + hydrostaticPressure
				+ ", label=" + label + "]";
	}

	private Double time;
    private Double dateTime;
    /**井深(m),所属表字段为 oil.WellDepth  */
    private Double wellDepth;
    /**垂深(m),所属表字段为 oil.HangDownDeep  */
    private Double hangDownDeep;
    /**钻头深度(m),所属表字段为 oil.DepthOfTheDrillBit  */
    private Double depthOfTheDrillBit;
    /**钻头垂深(m),所属表字段为 oil.DrillDownDeep  */
    private Double drillDownDeep;
    /**钻时(min/m),所属表字段为 oil.DrillingTime  */
    private Double drillingTime;
    /**钻压(KN),所属表字段为 oil.BitPressure  */
    private Double bitPressure;
    /**悬重(KN),所属表字段为 oil.HangingLoad  */
    private Double hangingLoad;
    /**转速(rpm),所属表字段为 oil.RotationRate  */
    private Double rotationRate;
    /**扭矩(KN.m),所属表字段为 oil.Torque  */
    private Double torque;
    /**方入(m),所属表字段为 oil.KellyDown  */
    private Double kellyDown;
    /**大钩位置(m),所属表字段为 oil.HookPosition  */
    private Double hookPosition;
    /**大钩速度(m/s),所属表字段为 oil.HookSpeed  */
    private Double hookSpeed;
    /**立压(MPa),所属表字段为 oil.StandpipePressureLog  */
    private Double standpipePressureLog;
    /**套压(MPa),所属表字段为 oil.CasingPressure  */
    private Double casingPressure;
    /**泵冲1(spm),所属表字段为 oil.PumpStroke1  */
    private Double pumpStroke1;
    /**泵冲2(spm),所属表字段为 oil.PumpStroke2  */
    private Double pumpStroke2;
    /**泵冲3(spm),所属表字段为 oil.PumpStroke3  */
    private Double pumpStroke3;
    /**总池体积(m3),所属表字段为 oil.TotalPoolSize  */
    private Double totalPoolSize;
    /**迟到时间(min),所属表字段为 oil.LayTime  */
    private Double layTime;
    /**泥浆溢漏(m3),所属表字段为 oil.MudSpill  */
    private Double mudSpill;
    /**入口流量log(L/s),所属表字段为 oil.InletFlowlog  */
    private Double inletFlowlog;
    /**出口流量log(%),所属表字段为 oil.OutletFlowlog  */
    private Double outletFlowlog;
    /**入口密度log(g/cc),所属表字段为 oil.InletDensitylog  */
    private Double inletDensitylog;
    /**出口密度log(g/cc),所属表字段为 oil.OutletDensitylog  */
    private Double outletDensitylog;
    /**入口温度(��),所属表字段为 oil.EntranceTempreture  */
    private Double entranceTempreture;
    /**出口温度(��),所属表字段为 oil.ExitTempreture  */
    private Double exitTempreture;
    /**总烃(%),所属表字段为 oil.TotalHydrocarbon  */
    private Double totalHydrocarbon;
    /**H2S(ppm),所属表字段为 oil.H2S  */
    private Double h2S;
    private Double c1;
    private Double c2;
    /**PWD垂深(m),所属表字段为 oil.PWDHangDownDeep  */
    private Double PWDHangDownDeep;
    /**PWD环空压力(MPa),所属表字段为 oil.PWDAnnularPressure  */
    private Double PWDAnnularPressure;
    /**PWD井斜(��),所属表字段为 oil.PWDWellDeviation  */
    private Double PWDWellDeviation;
    /**PWD方位(��),所属表字段为 oil.PWDLocation  */
    private Double PWDLocation;
    /**上返深度(m),所属表字段为 oil.UpturnDepth  */
    private Double upturnDepth;
    /**操作模式,所属表字段为 oil.OperatorSchema  */
    private Double operatorSchema;
    /**立压(MPa),所属表字段为 oil.StandpipePressure  */
    private Double standpipePressure;
    /**测量回压(MPa),所属表字段为 oil.MeasurementOfBackPressure  */
    private Double measurementOfBackPressure;
    /**出口流量(L/s),所属表字段为 oil.OutletFlow  */
    private Double outletFlow;
    /**出口密度(g/cc),所属表字段为 oil.OutletDensity  */
    private Double outletDensity;
    /**回压泵流(L/s),所属表字段为 oil.BackPressurePumpFlow  */
    private Double backPressurePumpFlow;
    /**循环回压(MPa),所属表字段为 oil.LoopBackPressure  */
    private Double loopBackPressure;
    /**附加回压(MPa),所属表字段为 oil.AdditionalBackPressure  */
    private Double additionalBackPressure;
    /**入口流量(L/s),所属表字段为 oil.InletFlow  */
    private Double inletFlow;
    /**定点深度(m),所属表字段为 oil.FixDepth  */
    private Double fixDepth;
    /**定点垂深(m),所属表字段为 oil.FixPointDownDeep  */
    private Double fixPointDownDeep;
    /**定点压力(MPa),所属表字段为 oil.FixPointPressure  */
    private Double fixPointPressure;
    /**井口调节(MPa),所属表字段为 oil.WellMouthAdjustment  */
    private Double wellMouthAdjustment;
    /**定点压耗(MPa),所属表字段为 oil.FixPointPressureLoss  */
    private Double fixPointPressureLoss;
    /**定点ECD(g/cm2),所属表字段为 oil.FixPointECD  */
    private Double fixPointECD;
    /**钻头ECD(g/cc),所属表字段为 oil.DrillECD  */
    private Double drillECD;
    /**钻柱压降(MPa),所属表字段为 oil.DrillStringPressureDrop  */
    private Double drillStringPressureDrop;
    /**钻头压降(MPa),所属表字段为 oil.DrillBitPressureDrop  */
    private Double drillBitPressureDrop;
    /**环控压耗(MPa),所属表字段为 oil.EnvironmentalControlPressureLoss  */
    private Double environmentalControlPressureLoss;
    /**目标回压(MPa),所属表字段为 oil.TargetBackPressure  */
    private Double targetBackPressure;
    /**静液压力(MPa),所属表字段为 oil.HydrostaticPressure  */
    private Double hydrostaticPressure;
    /**标签,所属表字段为 oil.Label  */
    private Double label;

    /**
     * 获取  字段:oil.Time
     *
     * @return  oil.Time
     */
    public Double getTime() {
        return time;
    }

    /**
     * 设置  字段:oil.Time
     *
     * @param time  oil.Time
     */
    public void setTime(Double time) {
        this.time = time;
    }

    /**
     * 获取  字段:oil.DateTime
     *
     * @return  oil.DateTime
     */
    public Double getDateTime() {
        return dateTime;
    }

    /**
     * 设置  字段:oil.DateTime
     *
     * @param dateTime  oil.DateTime
     */
    public void setDateTime(Double dateTime) {
        this.dateTime = dateTime;
    }

    /**
     * 获取 井深(m) 字段:oil.WellDepth
     *
     * @return  oil.WellDepth  ,井深(m)
     */
    public Double getWellDepth() {
        return wellDepth;
    }

    /**
     * 设置 井深(m) 字段:oil.WellDepth
     *
     * @param wellDepth  oil.WellDepth,井深(m)
     */
    public void setWellDepth(Double wellDepth) {
        this.wellDepth = wellDepth;
    }

    /**
     * 获取 垂深(m) 字段:oil.HangDownDeep
     *
     * @return  oil.HangDownDeep  ,垂深(m)
     */
    public Double getHangDownDeep() {
        return hangDownDeep;
    }

    /**
     * 设置 垂深(m) 字段:oil.HangDownDeep
     *
     * @param hangDownDeep  oil.HangDownDeep,垂深(m)
     */
    public void setHangDownDeep(Double hangDownDeep) {
        this.hangDownDeep = hangDownDeep;
    }

    /**
     * 获取 钻头深度(m) 字段:oil.DepthOfTheDrillBit
     *
     * @return  oil.DepthOfTheDrillBit  ,钻头深度(m)
     */
    public Double getDepthOfTheDrillBit() {
        return depthOfTheDrillBit;
    }

    /**
     * 设置 钻头深度(m) 字段:oil.DepthOfTheDrillBit
     *
     * @param depthOfTheDrillBit  oil.DepthOfTheDrillBit,钻头深度(m)
     */
    public void setDepthOfTheDrillBit(Double depthOfTheDrillBit) {
        this.depthOfTheDrillBit = depthOfTheDrillBit;
    }

    /**
     * 获取 钻头垂深(m) 字段:oil.DrillDownDeep
     *
     * @return  oil.DrillDownDeep  ,钻头垂深(m)
     */
    public Double getDrillDownDeep() {
        return drillDownDeep;
    }

    /**
     * 设置 钻头垂深(m) 字段:oil.DrillDownDeep
     *
     * @param drillDownDeep  oil.DrillDownDeep,钻头垂深(m)
     */
    public void setDrillDownDeep(Double drillDownDeep) {
        this.drillDownDeep = drillDownDeep;
    }

    /**
     * 获取 钻时(min/m) 字段:oil.DrillingTime
     *
     * @return  oil.DrillingTime  ,钻时(min/m)
     */
    public Double getDrillingTime() {
        return drillingTime;
    }

    /**
     * 设置 钻时(min/m) 字段:oil.DrillingTime
     *
     * @param drillingTime  oil.DrillingTime,钻时(min/m)
     */
    public void setDrillingTime(Double drillingTime) {
        this.drillingTime = drillingTime;
    }

    /**
     * 获取 钻压(KN)
 字段:oil.BitPressure
     *
     * @return  oil.BitPressure  ,钻压(KN)

     */
    public Double getBitPressure() {
        return bitPressure;
    }

    /**
     * 设置 钻压(KN)
 字段:oil.BitPressure
     *
     * @param bitPressure  oil.BitPressure,钻压(KN)

     */
    public void setBitPressure(Double bitPressure) {
        this.bitPressure = bitPressure;
    }

    /**
     * 获取 悬重(KN) 字段:oil.HangingLoad
     *
     * @return  oil.HangingLoad  ,悬重(KN)
     */
    public Double getHangingLoad() {
        return hangingLoad;
    }

    /**
     * 设置 悬重(KN) 字段:oil.HangingLoad
     *
     * @param hangingLoad  oil.HangingLoad,悬重(KN)
     */
    public void setHangingLoad(Double hangingLoad) {
        this.hangingLoad = hangingLoad;
    }

    /**
     * 获取 转速(rpm) 字段:oil.RotationRate
     *
     * @return  oil.RotationRate  ,转速(rpm)
     */
    public Double getRotationRate() {
        return rotationRate;
    }

    /**
     * 设置 转速(rpm) 字段:oil.RotationRate
     *
     * @param rotationRate  oil.RotationRate,转速(rpm)
     */
    public void setRotationRate(Double rotationRate) {
        this.rotationRate = rotationRate;
    }

    /**
     * 获取 扭矩(KN.m) 字段:oil.Torque
     *
     * @return  oil.Torque  ,扭矩(KN.m)
     */
    public Double getTorque() {
        return torque;
    }

    /**
     * 设置 扭矩(KN.m) 字段:oil.Torque
     *
     * @param torque  oil.Torque,扭矩(KN.m)
     */
    public void setTorque(Double torque) {
        this.torque = torque;
    }

    /**
     * 获取 方入(m) 字段:oil.KellyDown
     *
     * @return  oil.KellyDown  ,方入(m)
     */
    public Double getKellyDown() {
        return kellyDown;
    }

    /**
     * 设置 方入(m) 字段:oil.KellyDown
     *
     * @param kellyDown  oil.KellyDown,方入(m)
     */
    public void setKellyDown(Double kellyDown) {
        this.kellyDown = kellyDown;
    }

    /**
     * 获取 大钩位置(m) 字段:oil.HookPosition
     *
     * @return  oil.HookPosition  ,大钩位置(m)
     */
    public Double getHookPosition() {
        return hookPosition;
    }

    /**
     * 设置 大钩位置(m) 字段:oil.HookPosition
     *
     * @param hookPosition  oil.HookPosition,大钩位置(m)
     */
    public void setHookPosition(Double hookPosition) {
        this.hookPosition = hookPosition;
    }

    /**
     * 获取 大钩速度(m/s) 字段:oil.HookSpeed
     *
     * @return  oil.HookSpeed  ,大钩速度(m/s)
     */
    public Double getHookSpeed() {
        return hookSpeed;
    }

    /**
     * 设置 大钩速度(m/s) 字段:oil.HookSpeed
     *
     * @param hookSpeed  oil.HookSpeed,大钩速度(m/s)
     */
    public void setHookSpeed(Double hookSpeed) {
        this.hookSpeed = hookSpeed;
    }

    /**
     * 获取 立压(MPa) 字段:oil.StandpipePressureLog
     *
     * @return  oil.StandpipePressureLog  ,立压(MPa)
     */
    public Double getStandpipePressureLog() {
        return standpipePressureLog;
    }

    /**
     * 设置 立压(MPa) 字段:oil.StandpipePressureLog
     *
     * @param standpipePressureLog  oil.StandpipePressureLog,立压(MPa)
     */
    public void setStandpipePressureLog(Double standpipePressureLog) {
        this.standpipePressureLog = standpipePressureLog;
    }

    /**
     * 获取 套压(MPa) 字段:oil.CasingPressure
     *
     * @return  oil.CasingPressure  ,套压(MPa)
     */
    public Double getCasingPressure() {
        return casingPressure;
    }

    /**
     * 设置 套压(MPa) 字段:oil.CasingPressure
     *
     * @param casingPressure  oil.CasingPressure,套压(MPa)
     */
    public void setCasingPressure(Double casingPressure) {
        this.casingPressure = casingPressure;
    }

    /**
     * 获取 泵冲1(spm) 字段:oil.PumpStroke1
     *
     * @return  oil.PumpStroke1  ,泵冲1(spm)
     */
    public Double getPumpStroke1() {
        return pumpStroke1;
    }

    /**
     * 设置 泵冲1(spm) 字段:oil.PumpStroke1
     *
     * @param pumpStroke1  oil.PumpStroke1,泵冲1(spm)
     */
    public void setPumpStroke1(Double pumpStroke1) {
        this.pumpStroke1 = pumpStroke1;
    }

    /**
     * 获取 泵冲2(spm) 字段:oil.PumpStroke2
     *
     * @return  oil.PumpStroke2  ,泵冲2(spm)
     */
    public Double getPumpStroke2() {
        return pumpStroke2;
    }

    /**
     * 设置 泵冲2(spm) 字段:oil.PumpStroke2
     *
     * @param pumpStroke2  oil.PumpStroke2,泵冲2(spm)
     */
    public void setPumpStroke2(Double pumpStroke2) {
        this.pumpStroke2 = pumpStroke2;
    }

    /**
     * 获取 泵冲3(spm) 字段:oil.PumpStroke3
     *
     * @return  oil.PumpStroke3  ,泵冲3(spm)
     */
    public Double getPumpStroke3() {
        return pumpStroke3;
    }

    /**
     * 设置 泵冲3(spm) 字段:oil.PumpStroke3
     *
     * @param pumpStroke3  oil.PumpStroke3,泵冲3(spm)
     */
    public void setPumpStroke3(Double pumpStroke3) {
        this.pumpStroke3 = pumpStroke3;
    }

    /**
     * 获取 总池体积(m3) 字段:oil.TotalPoolSize
     *
     * @return  oil.TotalPoolSize  ,总池体积(m3)
     */
    public Double getTotalPoolSize() {
        return totalPoolSize;
    }

    /**
     * 设置 总池体积(m3) 字段:oil.TotalPoolSize
     *
     * @param totalPoolSize  oil.TotalPoolSize,总池体积(m3)
     */
    public void setTotalPoolSize(Double totalPoolSize) {
        this.totalPoolSize = totalPoolSize;
    }

    /**
     * 获取 迟到时间(min) 字段:oil.LayTime
     *
     * @return  oil.LayTime  ,迟到时间(min)
     */
    public Double getLayTime() {
        return layTime;
    }

    /**
     * 设置 迟到时间(min) 字段:oil.LayTime
     *
     * @param layTime  oil.LayTime,迟到时间(min)
     */
    public void setLayTime(Double layTime) {
        this.layTime = layTime;
    }

    /**
     * 获取 泥浆溢漏(m3) 字段:oil.MudSpill
     *
     * @return  oil.MudSpill  ,泥浆溢漏(m3)
     */
    public Double getMudSpill() {
        return mudSpill;
    }

    /**
     * 设置 泥浆溢漏(m3) 字段:oil.MudSpill
     *
     * @param mudSpill  oil.MudSpill,泥浆溢漏(m3)
     */
    public void setMudSpill(Double mudSpill) {
        this.mudSpill = mudSpill;
    }

    /**
     * 获取 入口流量log(L/s) 字段:oil.InletFlowlog
     *
     * @return  oil.InletFlowlog  ,入口流量log(L/s)
     */
    public Double getInletFlowlog() {
        return inletFlowlog;
    }

    /**
     * 设置 入口流量log(L/s) 字段:oil.InletFlowlog
     *
     * @param inletFlowlog  oil.InletFlowlog,入口流量log(L/s)
     */
    public void setInletFlowlog(Double inletFlowlog) {
        this.inletFlowlog = inletFlowlog;
    }

    /**
     * 获取 出口流量log(%) 字段:oil.OutletFlowlog
     *
     * @return  oil.OutletFlowlog  ,出口流量log(%)
     */
    public Double getOutletFlowlog() {
        return outletFlowlog;
    }

    /**
     * 设置 出口流量log(%) 字段:oil.OutletFlowlog
     *
     * @param outletFlowlog  oil.OutletFlowlog,出口流量log(%)
     */
    public void setOutletFlowlog(Double outletFlowlog) {
        this.outletFlowlog = outletFlowlog;
    }

    /**
     * 获取 入口密度log(g/cc) 字段:oil.InletDensitylog
     *
     * @return  oil.InletDensitylog  ,入口密度log(g/cc)
     */
    public Double getInletDensitylog() {
        return inletDensitylog;
    }

    /**
     * 设置 入口密度log(g/cc) 字段:oil.InletDensitylog
     *
     * @param inletDensitylog  oil.InletDensitylog,入口密度log(g/cc)
     */
    public void setInletDensitylog(Double inletDensitylog) {
        this.inletDensitylog = inletDensitylog;
    }

    /**
     * 获取 出口密度log(g/cc) 字段:oil.OutletDensitylog
     *
     * @return  oil.OutletDensitylog  ,出口密度log(g/cc)
     */
    public Double getOutletDensitylog() {
        return outletDensitylog;
    }

    /**
     * 设置 出口密度log(g/cc) 字段:oil.OutletDensitylog
     *
     * @param outletDensitylog  oil.OutletDensitylog,出口密度log(g/cc)
     */
    public void setOutletDensitylog(Double outletDensitylog) {
        this.outletDensitylog = outletDensitylog;
    }

    /**
     * 获取 入口温度(��) 字段:oil.EntranceTempreture
     *
     * @return  oil.EntranceTempreture  ,入口温度(��)
     */
    public Double getEntranceTempreture() {
        return entranceTempreture;
    }

    /**
     * 设置 入口温度(��) 字段:oil.EntranceTempreture
     *
     * @param entranceTempreture  oil.EntranceTempreture,入口温度(��)
     */
    public void setEntranceTempreture(Double entranceTempreture) {
        this.entranceTempreture = entranceTempreture;
    }

    /**
     * 获取 出口温度(��) 字段:oil.ExitTempreture
     *
     * @return  oil.ExitTempreture  ,出口温度(��)
     */
    public Double getExitTempreture() {
        return exitTempreture;
    }

    /**
     * 设置 出口温度(��) 字段:oil.ExitTempreture
     *
     * @param exitTempreture  oil.ExitTempreture,出口温度(��)
     */
    public void setExitTempreture(Double exitTempreture) {
        this.exitTempreture = exitTempreture;
    }

    /**
     * 获取 总烃(%) 字段:oil.TotalHydrocarbon
     *
     * @return  oil.TotalHydrocarbon  ,总烃(%)
     */
    public Double getTotalHydrocarbon() {
        return totalHydrocarbon;
    }

    /**
     * 设置 总烃(%) 字段:oil.TotalHydrocarbon
     *
     * @param totalHydrocarbon  oil.TotalHydrocarbon,总烃(%)
     */
    public void setTotalHydrocarbon(Double totalHydrocarbon) {
        this.totalHydrocarbon = totalHydrocarbon;
    }

    /**
     * 获取 H2S(ppm) 字段:oil.H2S
     *
     * @return  oil.H2S  ,H2S(ppm)
     */
    public Double getH2S() {
        return h2S;
    }

    /**
     * 设置 H2S(ppm) 字段:oil.H2S
     *
     * @param h2S  oil.H2S,H2S(ppm)
     */
    public void setH2S(Double h2S) {
        this.h2S = h2S;
    }

    /**
     * 获取  字段:oil.C1
     *
     * @return  oil.C1
     */
    public Double getC1() {
        return c1;
    }

    /**
     * 设置  字段:oil.C1
     *
     * @param c1  oil.C1
     */
    public void setC1(Double c1) {
        this.c1 = c1;
    }

    /**
     * 获取  字段:oil.C2
     *
     * @return  oil.C2
     */
    public Double getC2() {
        return c2;
    }

    /**
     * 设置  字段:oil.C2
     *
     * @param c2  oil.C2
     */
    public void setC2(Double c2) {
        this.c2 = c2;
    }

    /**
     * 获取 PWD垂深(m) 字段:oil.PWDHangDownDeep
     *
     * @return  oil.PWDHangDownDeep  ,PWD垂深(m)
     */
    public Double getPWDHangDownDeep() {
        return PWDHangDownDeep;
    }

    /**
     * 设置 PWD垂深(m) 字段:oil.PWDHangDownDeep
     *
     * @param PWDHangDownDeep  oil.PWDHangDownDeep,PWD垂深(m)
     */
    public void setPWDHangDownDeep(Double PWDHangDownDeep) {
        this.PWDHangDownDeep = PWDHangDownDeep;
    }

    /**
     * 获取 PWD环空压力(MPa) 字段:oil.PWDAnnularPressure
     *
     * @return  oil.PWDAnnularPressure  ,PWD环空压力(MPa)
     */
    public Double getPWDAnnularPressure() {
        return PWDAnnularPressure;
    }

    /**
     * 设置 PWD环空压力(MPa) 字段:oil.PWDAnnularPressure
     *
     * @param PWDAnnularPressure  oil.PWDAnnularPressure,PWD环空压力(MPa)
     */
    public void setPWDAnnularPressure(Double PWDAnnularPressure) {
        this.PWDAnnularPressure = PWDAnnularPressure;
    }

    /**
     * 获取 PWD井斜(��) 字段:oil.PWDWellDeviation
     *
     * @return  oil.PWDWellDeviation  ,PWD井斜(��)
     */
    public Double getPWDWellDeviation() {
        return PWDWellDeviation;
    }

    /**
     * 设置 PWD井斜(��) 字段:oil.PWDWellDeviation
     *
     * @param PWDWellDeviation  oil.PWDWellDeviation,PWD井斜(��)
     */
    public void setPWDWellDeviation(Double PWDWellDeviation) {
        this.PWDWellDeviation = PWDWellDeviation;
    }

    /**
     * 获取 PWD方位(��) 字段:oil.PWDLocation
     *
     * @return  oil.PWDLocation  ,PWD方位(��)
     */
    public Double getPWDLocation() {
        return PWDLocation;
    }

    /**
     * 设置 PWD方位(��) 字段:oil.PWDLocation
     *
     * @param PWDLocation  oil.PWDLocation,PWD方位(��)
     */
    public void setPWDLocation(Double PWDLocation) {
        this.PWDLocation = PWDLocation;
    }

    /**
     * 获取 上返深度(m) 字段:oil.UpturnDepth
     *
     * @return  oil.UpturnDepth  ,上返深度(m)
     */
    public Double getUpturnDepth() {
        return upturnDepth;
    }

    /**
     * 设置 上返深度(m) 字段:oil.UpturnDepth
     *
     * @param upturnDepth  oil.UpturnDepth,上返深度(m)
     */
    public void setUpturnDepth(Double upturnDepth) {
        this.upturnDepth = upturnDepth;
    }

    /**
     * 获取 操作模式 字段:oil.OperatorSchema
     *
     * @return  oil.OperatorSchema  ,操作模式
     */
    public Double getOperatorSchema() {
        return operatorSchema;
    }

    /**
     * 设置 操作模式 字段:oil.OperatorSchema
     *
     * @param operatorSchema  oil.OperatorSchema,操作模式
     */
    public void setOperatorSchema(Double operatorSchema) {
        this.operatorSchema = operatorSchema;
    }

    /**
     * 获取 立压(MPa) 字段:oil.StandpipePressure
     *
     * @return  oil.StandpipePressure  ,立压(MPa)
     */
    public Double getStandpipePressure() {
        return standpipePressure;
    }

    /**
     * 设置 立压(MPa) 字段:oil.StandpipePressure
     *
     * @param standpipePressure  oil.StandpipePressure,立压(MPa)
     */
    public void setStandpipePressure(Double standpipePressure) {
        this.standpipePressure = standpipePressure;
    }

    /**
     * 获取 测量回压(MPa) 字段:oil.MeasurementOfBackPressure
     *
     * @return  oil.MeasurementOfBackPressure  ,测量回压(MPa)
     */
    public Double getMeasurementOfBackPressure() {
        return measurementOfBackPressure;
    }

    /**
     * 设置 测量回压(MPa) 字段:oil.MeasurementOfBackPressure
     *
     * @param measurementOfBackPressure  oil.MeasurementOfBackPressure,测量回压(MPa)
     */
    public void setMeasurementOfBackPressure(Double measurementOfBackPressure) {
        this.measurementOfBackPressure = measurementOfBackPressure;
    }

    /**
     * 获取 出口流量(L/s) 字段:oil.OutletFlow
     *
     * @return  oil.OutletFlow  ,出口流量(L/s)
     */
    public Double getOutletFlow() {
        return outletFlow;
    }

    /**
     * 设置 出口流量(L/s) 字段:oil.OutletFlow
     *
     * @param outletFlow  oil.OutletFlow,出口流量(L/s)
     */
    public void setOutletFlow(Double outletFlow) {
        this.outletFlow = outletFlow;
    }

    /**
     * 获取 出口密度(g/cc) 字段:oil.OutletDensity
     *
     * @return  oil.OutletDensity  ,出口密度(g/cc)
     */
    public Double getOutletDensity() {
        return outletDensity;
    }

    /**
     * 设置 出口密度(g/cc) 字段:oil.OutletDensity
     *
     * @param outletDensity  oil.OutletDensity,出口密度(g/cc)
     */
    public void setOutletDensity(Double outletDensity) {
        this.outletDensity = outletDensity;
    }

    /**
     * 获取 回压泵流(L/s) 字段:oil.BackPressurePumpFlow
     *
     * @return  oil.BackPressurePumpFlow  ,回压泵流(L/s)
     */
    public Double getBackPressurePumpFlow() {
        return backPressurePumpFlow;
    }

    /**
     * 设置 回压泵流(L/s) 字段:oil.BackPressurePumpFlow
     *
     * @param backPressurePumpFlow  oil.BackPressurePumpFlow,回压泵流(L/s)
     */
    public void setBackPressurePumpFlow(Double backPressurePumpFlow) {
        this.backPressurePumpFlow = backPressurePumpFlow;
    }

    /**
     * 获取 循环回压(MPa) 字段:oil.LoopBackPressure
     *
     * @return  oil.LoopBackPressure  ,循环回压(MPa)
     */
    public Double getLoopBackPressure() {
        return loopBackPressure;
    }

    /**
     * 设置 循环回压(MPa) 字段:oil.LoopBackPressure
     *
     * @param loopBackPressure  oil.LoopBackPressure,循环回压(MPa)
     */
    public void setLoopBackPressure(Double loopBackPressure) {
        this.loopBackPressure = loopBackPressure;
    }

    /**
     * 获取 附加回压(MPa) 字段:oil.AdditionalBackPressure
     *
     * @return  oil.AdditionalBackPressure  ,附加回压(MPa)
     */
    public Double getAdditionalBackPressure() {
        return additionalBackPressure;
    }

    /**
     * 设置 附加回压(MPa) 字段:oil.AdditionalBackPressure
     *
     * @param additionalBackPressure  oil.AdditionalBackPressure,附加回压(MPa)
     */
    public void setAdditionalBackPressure(Double additionalBackPressure) {
        this.additionalBackPressure = additionalBackPressure;
    }

    /**
     * 获取 入口流量(L/s) 字段:oil.InletFlow
     *
     * @return  oil.InletFlow  ,入口流量(L/s)
     */
    public Double getInletFlow() {
        return inletFlow;
    }

    /**
     * 设置 入口流量(L/s) 字段:oil.InletFlow
     *
     * @param inletFlow  oil.InletFlow,入口流量(L/s)
     */
    public void setInletFlow(Double inletFlow) {
        this.inletFlow = inletFlow;
    }

    /**
     * 获取 定点深度(m) 字段:oil.FixDepth
     *
     * @return  oil.FixDepth  ,定点深度(m)
     */
    public Double getFixDepth() {
        return fixDepth;
    }

    /**
     * 设置 定点深度(m) 字段:oil.FixDepth
     *
     * @param fixDepth  oil.FixDepth,定点深度(m)
     */
    public void setFixDepth(Double fixDepth) {
        this.fixDepth = fixDepth;
    }

    /**
     * 获取 定点垂深(m) 字段:oil.FixPointDownDeep
     *
     * @return  oil.FixPointDownDeep  ,定点垂深(m)
     */
    public Double getFixPointDownDeep() {
        return fixPointDownDeep;
    }

    /**
     * 设置 定点垂深(m) 字段:oil.FixPointDownDeep
     *
     * @param fixPointDownDeep  oil.FixPointDownDeep,定点垂深(m)
     */
    public void setFixPointDownDeep(Double fixPointDownDeep) {
        this.fixPointDownDeep = fixPointDownDeep;
    }

    /**
     * 获取 定点压力(MPa) 字段:oil.FixPointPressure
     *
     * @return  oil.FixPointPressure  ,定点压力(MPa)
     */
    public Double getFixPointPressure() {
        return fixPointPressure;
    }

    /**
     * 设置 定点压力(MPa) 字段:oil.FixPointPressure
     *
     * @param fixPointPressure  oil.FixPointPressure,定点压力(MPa)
     */
    public void setFixPointPressure(Double fixPointPressure) {
        this.fixPointPressure = fixPointPressure;
    }

    /**
     * 获取 井口调节(MPa) 字段:oil.WellMouthAdjustment
     *
     * @return  oil.WellMouthAdjustment  ,井口调节(MPa)
     */
    public Double getWellMouthAdjustment() {
        return wellMouthAdjustment;
    }

    /**
     * 设置 井口调节(MPa) 字段:oil.WellMouthAdjustment
     *
     * @param wellMouthAdjustment  oil.WellMouthAdjustment,井口调节(MPa)
     */
    public void setWellMouthAdjustment(Double wellMouthAdjustment) {
        this.wellMouthAdjustment = wellMouthAdjustment;
    }

    /**
     * 获取 定点压耗(MPa) 字段:oil.FixPointPressureLoss
     *
     * @return  oil.FixPointPressureLoss  ,定点压耗(MPa)
     */
    public Double getFixPointPressureLoss() {
        return fixPointPressureLoss;
    }

    /**
     * 设置 定点压耗(MPa) 字段:oil.FixPointPressureLoss
     *
     * @param fixPointPressureLoss  oil.FixPointPressureLoss,定点压耗(MPa)
     */
    public void setFixPointPressureLoss(Double fixPointPressureLoss) {
        this.fixPointPressureLoss = fixPointPressureLoss;
    }

    /**
     * 获取 定点ECD(g/cm2) 字段:oil.FixPointECD
     *
     * @return  oil.FixPointECD  ,定点ECD(g/cm2)
     */
    public Double getFixPointECD() {
        return fixPointECD;
    }

    /**
     * 设置 定点ECD(g/cm2) 字段:oil.FixPointECD
     *
     * @param fixPointECD  oil.FixPointECD,定点ECD(g/cm2)
     */
    public void setFixPointECD(Double fixPointECD) {
        this.fixPointECD = fixPointECD;
    }

    /**
     * 获取 钻头ECD(g/cc) 字段:oil.DrillECD
     *
     * @return  oil.DrillECD  ,钻头ECD(g/cc)
     */
    public Double getDrillECD() {
        return drillECD;
    }

    /**
     * 设置 钻头ECD(g/cc) 字段:oil.DrillECD
     *
     * @param drillECD  oil.DrillECD,钻头ECD(g/cc)
     */
    public void setDrillECD(Double drillECD) {
        this.drillECD = drillECD;
    }

    /**
     * 获取 钻柱压降(MPa) 字段:oil.DrillStringPressureDrop
     *
     * @return  oil.DrillStringPressureDrop  ,钻柱压降(MPa)
     */
    public Double getDrillStringPressureDrop() {
        return drillStringPressureDrop;
    }

    /**
     * 设置 钻柱压降(MPa) 字段:oil.DrillStringPressureDrop
     *
     * @param drillStringPressureDrop  oil.DrillStringPressureDrop,钻柱压降(MPa)
     */
    public void setDrillStringPressureDrop(Double drillStringPressureDrop) {
        this.drillStringPressureDrop = drillStringPressureDrop;
    }

    /**
     * 获取 钻头压降(MPa) 字段:oil.DrillBitPressureDrop
     *
     * @return  oil.DrillBitPressureDrop  ,钻头压降(MPa)
     */
    public Double getDrillBitPressureDrop() {
        return drillBitPressureDrop;
    }

    /**
     * 设置 钻头压降(MPa) 字段:oil.DrillBitPressureDrop
     *
     * @param drillBitPressureDrop  oil.DrillBitPressureDrop,钻头压降(MPa)
     */
    public void setDrillBitPressureDrop(Double drillBitPressureDrop) {
        this.drillBitPressureDrop = drillBitPressureDrop;
    }

    /**
     * 获取 环控压耗(MPa) 字段:oil.EnvironmentalControlPressureLoss
     *
     * @return  oil.EnvironmentalControlPressureLoss  ,环控压耗(MPa)
     */
    public Double getEnvironmentalControlPressureLoss() {
        return environmentalControlPressureLoss;
    }

    /**
     * 设置 环控压耗(MPa) 字段:oil.EnvironmentalControlPressureLoss
     *
     * @param environmentalControlPressureLoss  oil.EnvironmentalControlPressureLoss,环控压耗(MPa)
     */
    public void setEnvironmentalControlPressureLoss(Double environmentalControlPressureLoss) {
        this.environmentalControlPressureLoss = environmentalControlPressureLoss;
    }

    /**
     * 获取 目标回压(MPa) 字段:oil.TargetBackPressure
     *
     * @return  oil.TargetBackPressure  ,目标回压(MPa)
     */
    public Double getTargetBackPressure() {
        return targetBackPressure;
    }

    /**
     * 设置 目标回压(MPa) 字段:oil.TargetBackPressure
     *
     * @param targetBackPressure  oil.TargetBackPressure,目标回压(MPa)
     */
    public void setTargetBackPressure(Double targetBackPressure) {
        this.targetBackPressure = targetBackPressure;
    }

    /**
     * 获取 静液压力(MPa) 字段:oil.HydrostaticPressure
     *
     * @return  oil.HydrostaticPressure  ,静液压力(MPa)
     */
    public Double getHydrostaticPressure() {
        return hydrostaticPressure;
    }

    /**
     * 设置 静液压力(MPa) 字段:oil.HydrostaticPressure
     *
     * @param hydrostaticPressure  oil.HydrostaticPressure,静液压力(MPa)
     */
    public void setHydrostaticPressure(Double hydrostaticPressure) {
        this.hydrostaticPressure = hydrostaticPressure;
    }

    /**
     * 获取 标签 字段:oil.Label
     *
     * @return  oil.Label  ,标签
     */
    public Double getLabel() {
        return label;
    }

    /**
     * 设置 标签 字段:oil.Label
     *
     * @param label  oil.Label,标签
     */
    public void setLabel(Double label) {
        this.label = label;
    }
}