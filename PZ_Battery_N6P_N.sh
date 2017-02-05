#!/system/bin/sh
#Author: Asiier
#Settings By: Asiier
#Edited For Angler By: Deani77
#Device: Nexus 6P
#Codename: Project Zhana (BT)
#Build Status: Experimental
#Version: 1.2
#Last Updated: 05/02/2017
#Notes: Please give credit when using this in your work!
#TWEAKS_BEGIN
echo '*************************'
echo DISCLAIMER:
echo This tweak is battery focused
echo If it feel a bit lag... Enable Input Boost
echo '*************************'
sleep 0.1
#Apply settings to LITTLE cluster
echo Applying settings to LITTLE Cluster...
sleep 0.1
#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Grab Maximum Achievable Frequency for the LITTLE Cluster
maxfreq=$(cat "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq")                
if test $maxfreq -eq 1555200; then
    #Temporarily change permissions to governor files for the LITTLE cluster to set the maximum frequency to 1555MHz
    echo No LITTLE Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 1555200 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1555MHz         
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 71 460800:70 600000:77 768000:81 960000:87 1248000:99 1344000:99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
elif test $maxfreq -eq 1708800; then
    #Temporarily change permissions to governor files for the LITTLE cluster to set the maximum frequency to 1555MHz
    echo LITTLE Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 1555200 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1555MHz         
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 71 460800:70 600000:77 768000:81 960000:87 1248000:99 1344000:99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
fi
sleep 0.2
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/*
echo 145000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 85000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 0 768000:175000 960000:185000 1344000:175000 1478000:120000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 119 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 22000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/fast_ramp_down
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
if [ -e "/sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction" ]; then
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction
    echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction
fi
sleep 0.2
#Apply settings to BIG cluster
echo Applying settings to BIG Cluster
sleep 0.1
#Temporarily change permissions to governor files for the BIG cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
#Grab Maximum Achievable Frequency for the BIG Cluster
maxfreq=$(cat "/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_max_freq")                
if test $maxfreq -eq 1958400; then
    #Temporarily change permissions to governor files for the BIG cluster to set the maximum frequency to 1958MHz
    echo No BIG Cluster Overclocking for maximum frequency detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo 1958400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq     #Core 4 Maximum Frequency = 1958MHz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
    echo 65 768000:75 960000:80 1248000:99 1440000:97 1824000:99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
elif test $maxfreq -eq 2054400; then
    #Temporarily change permissions to governor files for the BIG cluster to set the maximum frequency to 1958MHz
    echo BIG Cluster Overclocking for maximum frequency detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo 1958400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq     #Core 4 Maximum Frequency = 1958MHz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
    echo 65 768000:75 960000:80 1248000:99 1440000:97 1824000:99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
fi
#Grab Minimum Achievable Frequency for the BIG Cluster
minfreq=$(cat "/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_min_freq")                
if test $minfreq -eq 384000; then
    #Temporarily change permissions to governor files for the BIG cluster to set the minimum frequency to 384MHz
    echo No BIG Cluster Underclocking for minimum frequency detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
    echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq     #Core 4 Minimum Frequency = 384Hz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
elif test $minfreq -eq 302400; then
    #Temporarily change permissions to governor files for the BIG cluster to set the minimum frequency to 384MHz
    echo BIG Cluster Underclocking for minimum frequency detected.
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
    echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq     #Core 4 Minimum Frequency = 384MHz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
fi
sleep 0.2
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/*
#Tweak Interactive Governor
echo 140000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 1248000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 70000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 32000 960000:85000 1248000:96000 1440000:88000 1632000:80000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 11000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/fast_ramp_down
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
if [ -e "/sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction" ]; then
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction
    echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction
fi
sleep 0.2
#Disable TouchBoost and Enable Input Boost
echo Disabling TouchBoost
    if [ -e "/sys/module/msm_performance/parameters/touchboost" ]; then
    chmod 644 /sys/module/msm_performance/parameters/touchboost
    echo 0 > /sys/module/msm_performance/parameters/touchboost
else
    echo "*Not supported for your current Kernel*"
fi
sleep 0.1
echo Enabling Input Boost
    if [ -e "/sys/module/cpu_boost/parameters/input_boost_enabled" ]; then
    chmod 644 /sys/module/cpu_boost/parameters/input_boost_enabled
    echo 1 > /sys/module/cpu_boost/parameters/input_boost_enabled
    chmod 644 /sys/module/cpu_boost/parameters/input_boost_freq
    echo 0:600000 1:0 2:0 3:0 4:480000 5:0 6:0 7:0 > /sys/module/cpu_boost/parameters/input_boost_freq
    chmod 644 /sys/module/cpu_boost/parameters/boost_ms
    echo 0 > /sys/module/cpu_boost/parameters/boost_ms
    chmod 644 /sys/module/cpu_boost/parameters/input_boost_ms
    echo 75 > /sys/module/cpu_boost/parameters/input_boost_ms
else
    echo "*Not supported for your current Kernel*"
fi
sleep 0.1
#Tweaking Memory Value
echo Memory Values
echo 0 > /proc/sys/vm/swappiness
echo 100 > /proc/sys/vm/vfs_cache_pressure
echo 80 > /proc/sys/vm/dirty_ratio
echo 50 > /proc/sys/vm/dirty_background_ratio
echo 4096 > /proc/sys/vm/min_free_kbytes
sleep 0.2
echo ************************************************
echo This settings succesfully applied to your phone
echo Further tweaks can be done using kernel
echo tweaking application
echo ***********************************************
#################################################
#Modded by Deani77
#Please say thanks and give proper credits if you're using this profile. 
#Credits
#*Asiier *SoniCron *Alcolawl *RogerF81 *Patalao *Mostafa Wael *Senthil360 and all of those that have share their profiles on Nexus 5X/6P Advanced Interactive Tweaks respective threads. 
