LightStatus = 0
function sendData()

ldr=adc.read(0) -- reads value from Analog Input (max 1V)
print (ldr) -- print value on screen

  if ldr > 500 then  -- If sensor >500 detect status LED is on
        print("LED on")
        LightStatus = 1
        print (ldr)
  end         
  if ldr < 500 and LightStatus == 1 then  -- If sensor >500 detect status LED changed from on to off
        print("LED off")
        LightStatus = 0      
        print (ldr)
        dofile("ifttt.lua")
        print ("ifttt triggered")     
  end  
end 
tmr.alarm(0, 10000, 1, function() sendData() end )