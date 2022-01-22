#include "nvcom_01.h"

// ����� ������ ��������� DSP-����
extern int InA[30];
extern int InB[30];
extern int InX[30];
extern int OutS;
extern int Start_DSP;

main()
{
      int OutputS;
      int i;
      for (i=0;i<30;i++)
      {InA[i]=1;
      InB[i]=2;
      InX[i]=3;}

// ������������� ���� 0
      DCSR(0)  = 0;
      SR(0)    = 0;

// ����� � ������� ������ ���� 0
      PC(0)=((unsigned int)&Start_DSP - 0xb8440000)>>2;//(unsigned int)&PRAM)>>2;

// ����� � ������ ������� ������ ������� XRAM
// A0(0)=((unsigned int)&InA - 0xb8400000)>>2;//(unsigned int)&XRAM)>>2;
      A1(0)=((unsigned int)&InA - 0xb8400000)>>2;//(unsigned int)&XRAM)>>2;
      A2(0)=((unsigned int)&InB - 0xb8400000)>>2;//(unsigned int)&XRAM)>>2;
      A3(0)=((unsigned int)&InX - 0xb8400000)>>2;
      A4(0)=((unsigned int)&OutS - 0xb8400000)>>2;
// ���������� �������� ������� ���������� � ������ DSP-����


// ��������� ���� 0
      DCSR(0) = 0x4000;

// ���� ��������� ���������
      while( !(QSTR_DSP & (1<<3)) ) ;

// �������� ���������
      OutputS=OutS;
// "������" �������� ��� ��������� ����������� �����, ����� ���������� �������� ����������
      while(1);
};