#!/system/bin/sh
#Author: Asiier
#Settings By: Asiier
#Edited For Angler By: Deani77
#Device: Nexus 6P
#Codename: Project X.A.N.A (BTE)
#Build Status: Experimental
#Version: 1.0
#Last Updated: 02/02/2017
#Notes: Please give credit when using this in your work!
#TWEAKS_BEGIN

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE Cluster...
sleep 0.5
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
    echo 71 460800:70 600000:77 768000:81 960000:87 1248000:99 1344000:99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
elif test $maxfreq -eq 1708000; then
    #Temporarily change permissions to governor files for the Little cluster to set the maximum frequency to 1708MHz
    echo LITTLE Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 1708000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1708MHz         
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 71 460800:70 600000:77 768000:81 960000:87 1248000:99 1344000:99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
else
    echo "===================================================="
    echo Do not underclock!!! Set the clock speed to max and re-run the script.
    echo "===================================================="
fi
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/*
echo 145000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 86666 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 0 768000:175000 960000:185000 1344000:155000 1478000:120000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 155 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 23000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
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
sleep 0.5
#Apply settings to Big cluster
echo Applying settings to BIG Cluster
sleep 0.2
#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
#Grab Maximum Achievable Frequency for the Big Cluster
maxfreq=$(cat "/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_max_freq")                
if test $maxfreq -eq 1958400; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 1958MHz
    echo No BIG Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo 1958400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq     #Core 4 Maximum Frequency = 1958MHz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
    echo 65 768000:75 960000:80 1248000:99 1440000:97 1824000:99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads 
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
#Set overclock max frequency compatible target_loads
elif test $maxfreq -eq 2054000; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 2054MHz
    echo BIG Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo 2054000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq     #Core 4 Maximum Frequency = 2054MHz         
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
    echo 65 768000:75 960000:80 1248000:99 1440000:97 1824000:99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
else
    echo "===================================================="
    echo Do not underclock!!! Set the clock speed to max and re-run the script.
    echo "===================================================="
#Set normal max frequency target_loads
fi
sleep 0.5
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/*
#Tweak Interactive Governor
echo 160000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 960000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 96666 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 35000 960000:205000 1248000:175000 1440000:80000 1632000:180000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 400 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
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
sleep 0.2
echo "=========================================="
#Disable TouchBoost
echo Disabling TouchBoost
    if [ -e "/sys/module/msm_performance/parameters/touchboost" ]; then
    chmod 644 /sys/module/msm_performance/parameters/touchboost
    echo 0 > /sys/module/msm_performance/parameters/touchboost
else
    echo "*Not supported for your current Kernel*"
fi
#Disable BCL
echo Disabling BCL and Removing Perfd
echo disable > /sys/devices/soc/soc:qcom,bcl/mode
#Enable Core Control and Disable MSM Thermal Throttling allowing for longer sustained performance
echo Disabling Aggressive CPU Thermal Throttling
echo 1 > /sys/module/msm_thermal/core_control/enabled
echo N > /sys/module/msm_thermal/parameters/enabled
#Tweak HMP Scheduler to feed the Big cluster more tasks
sleep 0.3
echo Tweaking HMP Scheduler for correcting BIG Cluster utilization
echo 2 > /proc/sys/kernel/sched_window_stats_policy
echo 90 > /proc/sys/kernel/sched_upmigrate
echo 65 > /proc/sys/kernel/sched_downmigrate
echo 7 > /proc/sys/kernel/sched_spill_nr_run
echo 97 > /proc/sys/kernel/sched_spill_load
echo 30 > /proc/sys/kernel/sched_init_task_load
if [ -e "/proc/sys/kernel/sched_heavy_task" ]; then
    echo 96 > /proc/sys/kernel/sched_heavy_task
fi
if [ -e "/proc/sys/kernel/sched_enable_power_aware" ]; then
    echo 1 > /proc/sys/kernel/sched_enable_power_aware
fi
echo 7 > /proc/sys/kernel/sched_upmigrate_min_nice
echo 4 > /proc/sys/kernel/sched_ravg_hist_size
if [ -e "/proc/sys/kernel/sched_small_wakee_task_load" ]; then
	echo 15 > /proc/sys/kernel/sched_small_wakee_task_load
fi
if [ -e "/proc/sys/kernel/sched_wakeup_load_threshold" ]; then
	echo 110 > /proc/sys/kernel/sched_wakeup_load_threshold
fi
if [ -e "/proc/sys/kernel/sched_small_task" ]; then
	echo 15 > /proc/sys/kernel/sched_small_task
fi
if [ -e "/proc/sys/kernel/sched_big_waker_task_load" ]; then
	echo 33 > /proc/sys/kernel/sched_big_waker_task_load
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
	echo 610000 > /proc/sys/kernel/sched_freq_inc_notify
fi
if [ -e "/proc/sys/kernel/sched_boost" ]; then
	echo 0 > /proc/sys/kernel/sched_boost
fi
sleep 1
echo ------------------------------------------------------------
echo 'Project X.A.N.A v4.2' Successfully Applied!
echo "Project X.A.N.A Battery Extreme" > /data/system/current_profile
echo   You may now tweak them further
echo    using EXKM or Kernel Adiutor
echo ------------------------------------------------------------
echo ""
echo " Done,  this will be automatically closed..."
sleep 4

#################################################
#Modded by Deani77
#Please say thanks and give proper credits if you're using this profile. 
#Credits
#*Asiier *SoniCron *Alcolawl *RogerF81 *Patalao *Mostafa Wael *Senthil360 and all of those that have share their profiles on Nexus 5X/6P Advanced Interactive Tweaks respective threads. 
