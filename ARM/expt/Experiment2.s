
     AREA Test2,CODE,READONLY
     CODE32
     ENTRY

START
       B Reset_Handler

Undefined_Handler
       B Undefined_Handler

SWI_Handler
       B SWI_Handler

Prefetch_Handler
       B Prefetch_Handler

Abort_Handler
       B Abort_Handler
       
IRQ_Handler
       B IRQ_Handler
       
FIQ_Handler
       B FIQ_Handler

Reset_Handler

;����Systemģʽ

       MRS R0,CPSR                   ;����CPSR ��R0
       BIC R0,R0,#0x1F               ;���R0 �ĺ�5 λ
       ORR R0,R0,#0x1F               ;�趨R0 �����5 λΪ11111
       MSR CPSR_c,R0                 ;��R0 װ�ص�CPSR,�л���ϵͳģʽ
       
       MOV R0,#1                     ;��ϵͳģʽ�µ�R0��ֵ,�����R1~R14һ��
       MOV R1,#2
       MOV R2,#3
       MOV R3,#4
       MOV R4,#5
       MOV R5,#6
       MOV R6,#7
       MOV R7,#8
       MOV R8,#9
       MOV R9,#10
       MOV R10,#11
       MOV R11,#12
       MOV R12,#13
       MOV R13,#14
       MOV R14,#15

;����FIQģʽ

       MRS R0,CPSR
       BIC R0,R0,#0x1F
       ORR R0,R0,#0x11               ;�趨R0 �����5λΪ10001
       MSR CPSR_c,R0                 ;��R0 װ�ص�CPSR,�л���Fiq ģʽ
       
       MOV R8,#16                    ;��Fiq ģʽ�����л�����R8 ��ֵ,�����R9~R14һ��
       MOV R9,#17
       MOV R10,#18      
       MOV R11,#19
       MOV R12,#20
       MOV R13,#21
       MOV R14,#22

;����IRQģʽ

       MRS R0,CPSR
       BIC R0,R0,#0x1F
       ORR R0,R0,#0x12               ;�趨R0 �����5 λΪ10010
       MSR CPSR_c,R0                 ;��R0 װ�ص�CPSR,�л���IRQ ģʽ
      
       MOV R13,#23                   ;��IRQ ģʽ�����л�����R13 ��ֵ,�����R14һ��
       MOV R14,#24

;����SVCģʽ

       MRS R0,CPSR
       BIC R0,R0,#0x1F
       ORR R0,R0,#0x13               ;�趨R0 �����5 λΪ10011
       MSR CPSR_c,R0                 ;��R0 װ�ص�CPSR,�л���Svc ģʽ
      
       MOV R13,#25                   ;��SVC ģʽ�����л�����R13 ��ֵ, �����R14 һ��
       MOV R14,#26

;����Abortģʽ

       MRS R0,CPSR
       BIC R0,R0,#0x1F
       ORR R0,R0,#0x17               ;�趨R0 �����5 λΪ10111
       MSR CPSR_c,R0                 ;��R0 װ�ص�CPSR,�л���Abort ģʽ
       
       MOV R13,#27                   ;��Abort ģʽ�����л�����R13 ��ֵ, �����R14 һ��
       MOV R14,#28

;����UNDEFģʽ

       MRS R0,CPSR
       BIC R0,R0,#0x1F
       ORR R0,R0,#0x1b               ;�趨R0 �����5 λΪ11011
       MSR CPSR_c,R0                 ;��R0 װ�ص�CPSR,�л���UNDEF ģʽ

       MOV R13, #29                  ;��UNDEF ģʽ�����л�����R13 ��ֵ, �����R14 һ��
       MOV R14, #30

       B Reset_Handler               ;���Ƶ�Reset_Handlerѭ��

       END

