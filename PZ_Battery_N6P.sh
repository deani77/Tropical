#!/system/bin/sh
#Author: Asiier
#Settings By: Asiier
#Edited For Angler By: Deani77
#Device: Nexus 6P
#Codename: Project Zhana (BT)
#Build Status: Experimental
#Version: 1.1
#Last Updated: 04/02/2017
#Notes: Please give credit when using this in your work!
#TWEAKS_BEGIN
echo '*************************'
echo DISCLAIMER:
echo This tweak is battery focused
echo If feel a bit lag... Raised input boost freq
echo '*************************'
sleep 0.1
#Apply settings to LITTLE cluster
echo Applying settings to LITTLE Cluster...
#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Grab Maximum Achievable Frequency for the LITTLE Cluster
maxfreq=$(cat "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq")                
if test $maxfreq -eq 1555200; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 1555MHz
    echo No LITTLE Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 1555200 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1555MHz         
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 70 460800:65 600000:75 768000:82 960000:86 1248000:99 1344000:99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
elif test $maxfreq -eq 1708800; then
    #Temporarily change permissions to governor files for the Little cluster to set the maximum frequency to 1708MHz
    echo LITTLE Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 1708800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1708MHz         
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 70 460800:65 600000:75 768000:82 960000:86 1248000:99 1344000:99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
fi
sleep 0.1
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/*
#Tweak Interactive Governor
echo 220000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 100000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 0 768000:76000 960000:99000 1344000:150000 1478000:170000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 155 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 22000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/fast_ramp_down
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
if [ -e "/sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction" ]; then
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction
    echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction
fi
sleep 0.3
#Apply settings to Big cluster
echo Applying settings to BIG Cluster
#Temporarily change permissions to governor files for the BIG cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
#Grab Maximum Achievable Frequency for the Big Cluster
maxfreq=$(cat "/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_max_freq")                
if test $maxfreq -eq 1958400; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 1958MHz
    echo No BIG Cluster Overclocking for maximum frequency detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo 1958400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq     #Core 4 Maximum Frequency = 1958MHz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
    echo 65 960000:80 1248000:99 1440000:95 1824000:99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads 
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
elif test $maxfreq -eq 2054400; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 2054MHz
    echo BIG Cluster Overclocking for maximum frequency detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo 2054400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq     #Core 4 Maximum Frequency = 2054MHz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
    echo 65 960000:80 1248000:99 1440000:95 1824000:99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
fi
#Grab Minimum Achievable Frequency for the Big Cluster
minfreq=$(cat "/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_min_freq")                
if test $minfreq -eq 384000; then
    #Temporarily change permissions to governor files for the Big cluster to set the minimum frequency to 384MHz
    echo No BIG Cluster Underclocking for minimum frequency detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
    echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq     #Core 4 Minimum Frequency = 384Hz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
elif test $minfreq -eq 302400; then
    #Temporarily change permissions to governor files for the Big cluster to set the minimum frequency to 384MHz
    echo BIG Cluster Underclocking for minimum frequency detected.
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
    echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq     #Core 4 Minimum Frequency = 384MHz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
fi
sleep 0.1
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/*
#Tweak Interactive Governor
echo 140000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 1440000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 65000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 32000 960000:85000 1248000:96000 1440000:88000 1632000:80000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 11000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/fast_ramp_down
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
if [ -e "/sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction" ]; then
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction
    echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction
fi
sleep 0.3
#Disable TouchBoost and Enable Input Boost
echo Disabling TouchBoost
    if [ -e "/sys/module/msm_performance/parameters/touchboost" ]; then
    chmod 644 /sys/module/msm_performance/parameters/touchboost
    echo 0 > /sys/module/msm_performance/parameters/touchboost
else
    echo "*Not supported for your current Kernel*"
fi
echo Enable Input Boost LITTLE cluster
    if [ -e "/sys/module/cpu_boost/parameters/input_boost_enabled" ]; then
    chmod 644 /sys/module/cpu_boost/parameters/input_boost_enabled
    echo 1 > /sys/module/cpu_boost/parameters/input_boost_enabled
    chmod 644 /sys/module/cpu_boost/parameters/input_boost_freq
    echo 0:600000 1:0 2:0 3:0 4:0 5:0 6:0 7:0 > /sys/module/cpu_boost/parameters/input_boost_freq
    chmod 644 /sys/module/cpu_boost/parameters/boost_ms
    echo 0 > /sys/module/cpu_boost/parameters/boost_ms
    chmod 644 /sys/module/cpu_boost/parameters/input_boost_ms
    echo 100 > /sys/module/cpu_boost/parameters/input_boost_ms
else
    echo "*Not supported for your current Kernel*"
fi
sleep 0.2
#echo Tweaking HMP Scheduler for correcting BIG Cluster utilization
echo Tweaking HMP Scheduler for BIG cluster
echo 2 > /proc/sys/kernel/sched_window_stats_policy
echo 85 > /proc/sys/kernel/sched_upmigrate
echo 62 > /proc/sys/kernel/sched_downmigrate
echo 5 > /proc/sys/kernel/sched_spill_nr_run
echo 100 > /proc/sys/kernel/sched_spill_load
echo 30 > /proc/sys/kernel/sched_init_task_load
if [ -e "/proc/sys/kernel/sched_heavy_task" ]; then
    echo 65 > /proc/sys/kernel/sched_heavy_task
fi
if [ -e "/proc/sys/kernel/sched_enable_power_aware" ]; then
    echo 1 > /proc/sys/kernel/sched_enable_power_aware
fi
echo 10 > /proc/sys/kernel/sched_upmigrate_min_nice
echo 4 > /proc/sys/kernel/sched_ravg_hist_size
if [ -e "/proc/sys/kernel/sched_small_wakee_task_load" ]; then
	echo 7 > /proc/sys/kernel/sched_small_wakee_task_load
fi
if [ -e "/proc/sys/kernel/sched_wakeup_load_threshold" ]; then
	echo 110 > /proc/sys/kernel/sched_wakeup_load_threshold
fi
if [ -e "/proc/sys/kernel/sched_small_task" ]; then
	echo 7 > /proc/sys/kernel/sched_small_task
fi
if [ -e "/proc/sys/kernel/sched_big_waker_task_load" ]; then
	echo 35 > /proc/sys/kernel/sched_big_waker_task_load
fi
echo 950000 > /proc/sys/kernel/sched_rt_runtime_us
echo 1000000 > /proc/sys/kernel/sched_rt_period_us
if [ -e "/proc/sys/kernel/sched_migration_fixup" ]; then
	echo 1 > /proc/sys/kernel/sched_migration_fixup
fi
if [ -e "/proc/sys/kernel/sched_freq_dec_notify" ]; then
	echo 410000 > /proc/sys/kernel/sched_freq_dec_notify
fi
if [ -e "/proc/sys/kernel/sched_freq_inc_notify" ]; then
	echo 600000 > /proc/sys/kernel/sched_freq_inc_notify
fi
if [ -e "/proc/sys/kernel/sched_boost" ]; then
	echo 0 > /proc/sys/kernel/sched_boost
fi
sleep 0.2
echo ·Memory Values
echo 0 > /proc/sys/vm/swappiness
echo 100 > /proc/sys/vm/vfs_cache_pressure
echo 80 > /proc/sys/vm/dirty_ratio
echo 50 > /proc/sys/vm/dirty_background_ratio
echo 4096 > /proc/sys/vm/min_free_kbytes
sleep 0.2
echo ************************************************
echo This settings succesfully applied to your phone
echo     Further tweaks can be done using kernel
echo             tweaking application
echo ***********************************************
#################################################
#Modded by Deani77
#Please say thanks and give proper credits if you're using this profile. 
#Credits
#*Asiier *SoniCron *Alcolawl *RogerF81 *Patalao *Mostafa Wael *Senthil360 and all of those that have share their profiles on Nexus 5X/6P Advanced Interactive Tweaks respective threads. 
