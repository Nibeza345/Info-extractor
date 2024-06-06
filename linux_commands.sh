public_ip() {
    echo "System's Public IP:"
    curl -s https://ifconfig.me
    echo # Print a newline
}

private_ip() {
    echo "System's Private IP:"
    hostname -I | awk '{print $1}'
}

mac_address() {
    echo "System's MAC Address (masked):"
    ifconfig | grep ether | awk '{print "MAC Address: " $2}'
}

cpu_usage() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,%cpu,comm --sort=-%cpu | head -6
}

memory_usage() {
    echo "Memory Usage Statistics:"
    free -h | awk 'NR==1{print "Total Memory:", $2} NR==2{print "Available Memory:", $7}'
}

active_services() {
    echo "Active System Services:"
    systemctl list-units --type=service --state=running
}

largest_files() {
    echo "Top 10 Largest Files in /home:"
    du -ah /home | sort -rh | head -n 10
}

network_info() {
    echo "Network Interface Details:"
    ip addr show
}

network_security() {
    echo "Open Ports and Listening Services:"
    netstat -tuln
}

logged_in_users() {
    echo "Currently Logged-in Users:"
    who
}

process_details() {
    echo "Process Details:"
    ps aux
}

all() {
    public_ip
    private_ip
    mac_address
    cpu_usage
    memory_usage
    active_services
    largest_files
    network_info
    network_security
    logged_in_users
    process_details
}

while true; 
    echo "Choose an option:"
    echo "1. Identify the system's public IP."
    echo "2. Identify the private IP address assigned to the system's network interface."
    echo "3. Display the MAC address."
    echo "4. Display the percentage of CPU usage for the top 5 processes."
    echo "5. Display memory usage statistics."
    echo "6. List active system services with their status."
    echo "7. Locate the Top 10 Largest Files in /home."
    echo "8. Display network interface details."
    echo "9. Display open ports and listening services."
    echo "10. Display currently logged-in users."
    echo "11. Display process details."
    echo "12. Execute all functionalities."
    echo "13. Exit."

    read choice

    case $choice in
        1) public_ip ;;
        2) private_ip ;;
        3) mac_address ;;
        4) cpu_usage ;;
        5) memory_usage ;;
        6) active_services ;;
        7) largest_files ;;
        8) network_info ;;
        9) network_security ;;
        10)logged_in_users ;;
        11) process_details ;;
        12) all ;;
        13) echo "Exiting..."; exit ;;
        *) echo "Invalid option." ;;
    esac

    echo # Print a newline after each option is executed
done

