#include "nvcom_01.h"

// Адрес начала программы DSP-ядра
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

// Останавливаем ядро 0
      DCSR(0)  = 0;
      SR(0)    = 0;

// Пишем в счётчик команд ядра 0
      PC(0)=((unsigned int)&Start_DSP - 0xb8440000)>>2;//(unsigned int)&PRAM)>>2;

// Пишем в первый сегмент памяти даннных XRAM
// A0(0)=((unsigned int)&InA - 0xb8400000)>>2;//(unsigned int)&XRAM)>>2;
      A1(0)=((unsigned int)&InA - 0xb8400000)>>2;//(unsigned int)&XRAM)>>2;
      A2(0)=((unsigned int)&InB - 0xb8400000)>>2;//(unsigned int)&XRAM)>>2;
      A3(0)=((unsigned int)&InX - 0xb8400000)>>2;
      A4(0)=((unsigned int)&OutS - 0xb8400000)>>2;
// записываем значения входных переменных в память DSP-ядра


// Запускаем ядро 0
      DCSR(0) = 0x4000;

// ждем окончания процедуры
      while( !(QSTR_DSP & (1<<3)) ) ;

// забираем результат
      OutputS=OutS;
// "лишний" оператор для установки контрольной точки, чтобы посмотреть значения переменных
      while(1);
};