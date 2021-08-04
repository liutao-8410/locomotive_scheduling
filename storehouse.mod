/*********************************************
 * OPL 12.6.3.0 Model
 * Author: 12399
 * Creation Date: 2021-8-4 at ����8:38:52
 *********************************************/
//�������
int fixed = ...; //���崴��һ���ֿ�Ĺ̶�����
{string} warehouses = ...;  //����ֿ���
int nbstores = ...; //�����̵�����
range stores = 0..nbstores-1; //�����̵�Ǳ�
int capacity[warehouses] = ...; //����ֿ�Ĵ�������
int supplycost[stores][warehouses] = ...; //����

//������߱���
dvar boolean open[warehouses]; //������Щ�ֿ�
dvar boolean supply[stores][warehouses]; //ÿ���̵����ĸ��ֿ�����

//����Ŀ�꺯��
minimize
  sum(w in warehouses) fixed * open[w] +
  sum(w in warehouses,s in stores) supply[s][w] * supplycost[s][w];
  
//����Լ������
subject to{
	ct1:// һ���̵�ֻ����һ���ֿ�����
	forall(s in stores) sum(w in warehouses) supply[s][w] == 1;
	ct2: // ����Ĳֿ����ʹ��
	forall(w in warehouses,s in stores) supply[s][w] <= open[w];
	ct3: // ÿ���ֿⶼ�������������
	forall(w in warehouses) sum(s in stores) supply [s][w] <= capacity[w];
}

//���б�ע
{int} storesof[w in warehouses] = {s| s in stores : supply[s][w] == 1 };
execute DISPLAY_RESULT{
	writeln("open=",open);
	writeln("storesof",storesof);
}

