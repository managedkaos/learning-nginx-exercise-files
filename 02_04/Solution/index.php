<!DOCTYPE html>
<html>
<head>
    <title>Appointments</title>
    <style type="text/css">
		body {
			font-size: 15px;
			color: #343d44;
			font-family: "segoe-ui", "open-sans", tahoma, arial;
			padding: 0;
			margin: 0;
		}
		table {
			margin: auto;
			font-family: "Lucida Sans Unicode", "Lucida Grande", "Segoe Ui";
			font-size: 12px;
		}

		h1 {
			margin: 25px auto 0;
			text-align: center;
			text-transform: uppercase;
			font-size: 17px;
		}

		table td {
			transition: all .5s;
		}

		/* Table */
		.data-table {
			border-collapse: collapse;
			font-size: 14px;
			min-width: 537px;
		}

		.data-table th,
		.data-table td {
			border: 1px solid #e1edff;
			padding: 7px 17px;
		}
		.data-table caption {
			margin: 7px;
		}

		/* Table Header */
		.data-table thead th {
			background-color: #508abb;
			color: #FFFFFF;
			border-color: #6ea1cc !important;
			text-transform: uppercase;
		}

		/* Table Body */
		.data-table tbody td {
			color: #353535;
		}
		.data-table tbody td {
			text-align: left;
		}

		.data-table tbody tr:nth-child(odd) td {
			background-color: #f4fbff;
		}
		.data-table tbody tr:hover td {
			background-color: #ffffa2;
			border-color: #ffff0f;
		}

		/* Table Footer */
		.data-table tfoot th {
			background-color: #e5f5ff;
			text-align: left;
		}
		.data-table tfoot th:first-child {
			text-align: left;
		}
		.data-table tbody td:empty
		{
			background-color: #ffcccc;
		}
	</style>
</head>
<body>
    <h1>Wisdom Pet Medicine Appointments</h1>
    <?php
        echo "<p align='center'>Today is " . date("m/d/Y") . "</p>";
    ?>
    <table class="data-table">
        <tr>
            <th>Pet Name</th>
            <th>Owner Name</th>
            <th>Appointment Date</th>
            <th>Reason for Appointment</th>
        </tr>
        <?php
            $conn = mysqli_connect('localhost', 'admin', 'admin', 'appointments');
            if (!$conn) {
                die ('Failed to connect to MySQL: ' . mysqli_connect_error());
            }

            $result = mysqli_query($conn, 'SELECT * FROM data');

            if (!$result) {
                die ('SQL Error: ' . mysqli_error($conn));
            }

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr><td>". $row["Pet_Name"] ."</td><td>". $row["Owner_Name"] ."</td><td>". $row["Appointment_date"] ."</td><td>". $row["Reason_for_appointment"] ."</td></tr>";
                }
            }
        ?>
    </table>
</body>
</html>
