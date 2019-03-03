#include <application.h>

LEDStatus status(LED_PATTERN_BLINK, LED_SPEED_FAST);

constexpr system_tick_t debounce = 250;

void loop() {
   static uint32_t cnt(0);
   static system_tick_t next(0);

   if(millis() > next && System.buttonPushed()) {
      Particle.publish("pushed", "!", PRIVATE);
      next = millis() + debounce;
      ++cnt;
   }
}
