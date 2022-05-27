#include <ichibotArduinoNano.h>
ichibotArduinoNano ichibot;

void setup() {
  //  ichibot.sudutGripperAngkat = 60;
  //  ichibot.sudutGripperTaruh  = 30;
  //  ichibot.sudutGripperJepit  = 70;
  //  ichibot.sudutGripperLepas  = 130;
  //  ichibot.delayGripper = 1000;

  ichibot.begin();                                                                        // inisialisasi robot
  //ichibot.useAutoScanMenu = 1;                                                            // 1 = autoscan, 0 = manual scan
  ichibot.setSensorSensivity(50);                                                         // set sensivity untuk kalibrasi otomatis; set nilai dari 1 (paling tidak sensitif) sampai 100 (paling sensisitif);
  //ichibot.setLimitSensorManual(1023,200,1023,200,200,200,200,200,200,200,200, 1023);      // set nilai kalibrasi manual jika ingin memakai set manual secara hardcode;
  ichibot.setFanMode(ACTIVE_HIGH);                                                        // set mode activasi kipas
  ichibot.setBuzzerMode(HIGH);                                                            // set buzzer notifikasi index
  ichibot.setLineWidth(TWO_CM);                                                           // set lebar garis TWO_CM, THREE_CM, FOUR_CM, MIX (gabungan)

  //set inisialisasi PID : nomor, Kp, Ki, Kd , PMax , PMin
  ichibot.setPID(PID_0, 7, 0, 5, 255, -50);
  ichibot.setPID(PID_1, 8, 10, 10, 255, -60);
  ichibot.setPID(PID_2, 9, 15, 15, 255, -70);
  ichibot.setPID(PID_3, 10, 20, 20, 255, -80);
  ichibot.setPID(PID_4, 12, 25, 25 , 255, -90);
  ichibot.setPID(PID_5, 13, 30, 30, 255, -100);

  // ========================== CHECK POINT ==========================  //
  // MENGATUR INDEX PADA SETIAP CHECK POINT, TERDAPAT 6 BUAH CHECKPOINT //
  ichibot.setCheckPoint (CP_0, 0);
  ichibot.setCheckPoint (CP_1, 19);
  ichibot.setCheckPoint (CP_2, 21);
  ichibot.setCheckPoint (CP_3, 7);
  ichibot.setCheckPoint (CP_4, 9);

  // =============================                TEMPLATE             =============================  //
  /*
                                  L    R   D                   SA  TA
     ichibot.setIndex(0, MOTION, 100, 100, 10, SENSOR_SEMUA,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
                                      D                        SA  TA
     ichibot.setIndex(1, BELOK_KIRI, 100, SENSOR_KIRI_TENGAH,  170, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL)
                                D                         SA  TA
     ichibot.setIndex(2, STOP, 100, SENSOR_KANAN_TENGAH ,  0, 30, PID_0, GARIS_HITAM, KIPAS_ON,NORMAL);
  */
     
  // =============== STOP INDEX =============== ROBOT AKAN BERHENTI JIKA SUDAH MENCAPAI INDEX DIBAWAH INI //
   
     ichibot.setStopIndex(23);
  
 // ============================= TEMPAT MENULISKAN SEMUA PERINTAH INDEX =============================  //
     
      ichibot.setIndex(0, MOTION, 80, 80, 50, SENSOR_KOSONG, 150, 0, PID_0, GARIS_HITAM, KIPAS_OFF,NORMAL);
      ichibot.setIndex(1,LURUS, 30, SENSOR_SEMUA,  80, 5, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL); 
      ichibot.setIndex(2, MOTION, 70, 210, 100, SENSOR_KIRI, 150, 0, PID_0, GARIS_HITAM, KIPAS_OFF,NORMAL);
      ichibot.setIndex(3, MOTION, 160, 150, 160, SENSOR_KOSONG, 150, 0, PID_0, GARIS_HITAM, KIPAS_OFF,NORMAL);
      ichibot.setIndex(4, MOTION, 160, 100, 160, SENSOR_KOSONG, 150, 0, PID_0, GARIS_HITAM, KIPAS_OFF,NORMAL);
      ichibot.setIndex(5, MOTION, 100, 160, 140, SENSOR_KOSONG, 150, 0, PID_0, GARIS_HITAM, KIPAS_OFF,NORMAL);
      ichibot.setIndex(6,LURUS, 50, SENSOR_SEMUA,  80, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(7,BELOK_KANAN, 80, SENSOR_KANAN,  90, 10, PID_3, GARIS_HITAM , KIPAS_OFF);
      ichibot.setIndex(8,BELOK_KIRI, 20, SENSOR_KIRI,  55, 10, PID_3, GARIS_HITAM , KIPAS_OFF);
      //N
      ichibot.setIndex(9, MOTION, 250, -250, 125, SENSOR_KANAN, 100, 0, PID_0, GARIS_HITAM, KIPAS_OFF,NORMAL);
      ichibot.setIndex(10,LURUS, 85, SENSOR_KOSONG,  30, 5, PID_4, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(11, MOTION, -255, 255, 125, SENSOR_KIRI, 100, 0, PID_0, GARIS_HITAM, KIPAS_OFF,NORMAL);
      
      ichibot.setIndex(12,BELOK_KANAN, 40, SENSOR_KANAN,  5, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(13,LURUS, 40, SENSOR_KANAN,  30, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(14,BELOK_KIRI, 40, SENSOR_KIRI,  30, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(15,LURUS, 40, SENSOR_KANAN,  30, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(16,BELOK_KANAN, 40, SENSOR_KANAN,  30, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(17,LURUS, 40, SENSOR_KANAN,  30, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(18,LURUS, 80, SENSOR_SEMUA,  80, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      //CheckPoint
      ichibot.setIndex(19,LURUS, 50, SENSOR_KIRI,  80, 5, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(20,BELOK_KIRI, 80, SENSOR_KIRI,  80, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(21,LURUS, 20, SENSOR_KIRI,  80, 5, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(22,LURUS, 20, SENSOR_KIRI,  120, 5, PID_4, GARIS_HITAM , KIPAS_OFF,NORMAL);
       //ichibot.setIndex(23,LURUS, 20, SENSOR_KIRI,  20, 5, PID_4, GARIS_HITAM , KIPAS_OFF,NORMAL);
      //ichibot.setIndex(23,LURUS, 20, SENSOR_KIRI,  50, 5, PID_4, GARIS_HITAM , KIPAS_OFF,NORMAL);
      //ichibot.setIndex(23, MOTION, 200, -200, 114, SENSOR_KANAN, 100, 0, PID_0, GARIS_HITAM, KIPAS_OFF,NORMAL);
      
      ichibot.setIndex(23,BELOK_KIRI, 40, SENSOR_KIRI_TENGAH,  20, 3, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
       //ichibot.setIndex(24,BELOK_KANAN, 20, SENSOR_KANAN,  50, 5, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(24,MOTION,75, 150, 120, SENSOR_KIRI,  150, 3, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
      /*
      ichibot.setIndex(25,MOTION,100, 50, 100, SENSOR_KOSONG,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
       ichibot.setIndex(26,MOTION,80, 80, 120, SENSOR_KOSONG,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
       ichibot.setIndex(27,MOTION,80, 80, 120, SENSOR_KOSONG,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
       ichibot.setIndex(28,MOTION,80, 80, 120, SENSOR_KOSONG,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
        ichibot.setIndex(29,MOTION,50, 100, 100, SENSOR_KOSONG,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
        ichibot.setIndex(30,MOTION,100, -50, 200, SENSOR_KOSONG,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
        ichibot.setIndex(31,MOTION,80, 80, 100, SENSOR_KOSONG,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
        ichibot.setIndex(32,MOTION,80, 80, 100, SENSOR_KOSONG,  150, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
      */
      /*
      ichibot.setIndex(25,BELOK_KANAN, 20, SENSOR_KANAN_TENGAH,  20, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(26,BELOK_KIRI, 20, SENSOR_KIRI,  20, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(27,LURUS, 35, SENSOR_SEMUA_KENA,  50, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      
      ichibot.setIndex(28,LURUS, 35, SENSOR_KOSONG,  200, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(29,BELOK_KANAN, 40, SENSOR_KANAN,  30, 5, PID_2, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(30,BELOK_KIRI, 20, SENSOR_KIRI, 70, 3, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      */
      /*
      ichibot.setIndex(24,LURUS, 20, SENSOR_KIRI_TENGAH,  50, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(25,BELOK_KIRI, 20, SENSOR_KIRI_TENGAH,  50, 5, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(26,BELOK_KANAN, 20, SENSOR_KANAN_TENGAH,  50, 5, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
      */
      //X
      ichibot.setIndex(26,BELOK_KIRI, 20, SENSOR_SEMUA,  50, 5, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(27,BELOK_KIRI, 50, SENSOR_KIRI,  80, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(28,LURUS, 50, SENSOR_SEMUA,  80, 5, PID_2, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(29, MOTION, 200, -200, 120, SENSOR_KANAN, 100, 0, PID_3, GARIS_HITAM, KIPAS_OFF,NORMAL);
      //ichibot.setIndex(28,BELOK_KIRI, 20, SENSOR_KIRI,  50, 5, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
      ichibot.setIndex(30,BELOK_KANAN, 20, SENSOR_KANAN,  80, 5, PID_5, GARIS_HITAM , KIPAS_OFF,NORMAL);
      //ichibot.setIndex(10,LURUS, 40, SENSOR_SEMUA,  5, 5, PID_3, GARIS_HITAM , KIPAS_OFF,NORMAL);
     
}

   void loop() {
   ichibot.run();
   }