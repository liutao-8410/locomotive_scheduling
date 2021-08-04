/*********************************************
 * OPL 12.6.3.0 Model
 * Author: 12399
 * Creation Date: 2021-8-4 at 下午8:38:52
 *********************************************/
//定义参数
int fixed = ...; //定义创建一个仓库的固定费用
{string} warehouses = ...;  //定义仓库名
int nbstores = ...; //定义商店数量
range stores = 0..nbstores-1; //定义商店角标
int capacity[warehouses] = ...; //定义仓库的储存能力
int supplycost[stores][warehouses] = ...; //定义

//定义决策变量
dvar boolean open[warehouses]; //开设那些仓库
dvar boolean supply[stores][warehouses]; //每个商店有哪个仓库配送

//定义目标函数
minimize
  sum(w in warehouses) fixed * open[w] +
  sum(w in warehouses,s in stores) supply[s][w] * supplycost[s][w];
  
//定义约束条件
subject to{
	ct1:// 一个商店只能由一个仓库配送
	forall(s in stores) sum(w in warehouses) supply[s][w] == 1;
	ct2: // 开设的仓库才能使用
	forall(w in warehouses,s in stores) supply[s][w] <= open[w];
	ct3: // 每个仓库都不超过最大容量
	forall(w in warehouses) sum(s in stores) supply [s][w] <= capacity[w];
}

//进行备注
{int} storesof[w in warehouses] = {s| s in stores : supply[s][w] == 1 };
execute DISPLAY_RESULT{
	writeln("open=",open);
	writeln("storesof",storesof);
}

