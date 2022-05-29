[
  {
    "name": "${ecs_service_container_name}",
    "image": "neerajguna/ctwordpress:latest",
    "portMappings": [
      {
        "containerPort": 80,
        "protocol": "tcp"
      }
    ],
    "secrets": [{
      "name": "WORDPRESS_DB_PASSWORD",
      "valueFrom": "${database_password}"
    }],
    "environment": [
      {
        "name": "WORDPRESS_DB_HOST",
        "value": "${wordpress_db_host}"
      },
      {
        "name": "WORDPRESS_DB_USER",
        "value": "${wordpress_db_user}"
      },
      {
        "name": "WORDPRESS_DB_NAME",
        "value": "${wordpress_db_name}"
      }
    ],

    "mountPoints": [
     {
      "readOnly": false,
      "containerPath": "/var/www/html/wp-content/plugins",
      "sourceVolume": "efs-plugins"
     },
     {
      "readOnly": false,
      "containerPath": "/var/www/html/wp-content/themes",
      "sourceVolume": "efs-themes"
     },
     {
      "readOnly": false,
      "containerPath": "/var/www/html/wp-content/uploads",
      "sourceVolume": "efs-uploads"
      }
    ]
  }
]
