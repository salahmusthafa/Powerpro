// Fetch data from the server
function fetchData() {
    // Fetch building information
    fetch('get_building_info.php')
        .then(response => response.json())
        .then(buildingInfo => {
            // Update building information on the page
            document.getElementById('building-name').textContent = `Building Name: ${buildingInfo.building_name}`;
            document.getElementById('building-owner').textContent = `Owner: ${buildingInfo.building_owner_name}`;
            document.getElementById('total-consumption').textContent = `Total Consumption: ${buildingInfo.building_consumption} kWh`;
        })
        .catch(error => console.error('Error fetching building information:', error));

    // Fetch chart data
    fetch('get_building_consumption.php')
        .then(response => response.json())
        .then(data => {
            // Extract data for the chart
            const labels = data.map(item => item.building_name);
            const values = data.map(item => item.total_building_consumption);

            // Create a Chart.js chart
            const ctx = document.getElementById('buildingConsumptionChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Total Consumption',
                        data: values,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Error fetching chart data:', error));
}

// Call the fetchData function when the page loads
window.onload = fetchData;
