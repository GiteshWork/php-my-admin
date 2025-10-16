# php-my-admin
Thank you for installing the phpMyAdmin chart!

By default, phpMyAdmin is configured with the following databases:
  - DB1: {{ .Values.env.PMA_HOSTS | split "," | first }}
  - DB2: {{ .Values.env.PMA_HOSTS | split "," | last }}

You can access phpMyAdmin using the service:
  kubectl get svc {{ include "phpmyadmin.fullname" . }}

---

## Adding more databases dynamically

You can add more database hosts or custom environment variables without editing the chart by using the `extraEnvVars` section in `values.yaml`.

Example:

extraEnvVars:
  - name: PMA_HOST_DB3
    value: "db3.wishfin.com"
  - name: PMA_USER_DB3
    valueFrom:
      secretKeyRef:
        name: phpmyadmin-db-creds
        key: DB3_USER
  - name: PMA_PASSWORD_DB3
    valueFrom:
      secretKeyRef:
        name: phpmyadmin-db-creds
        key: DB3_PASSWORD

> Note: Make sure the secrets exist before deploying or upgrading the chart.

After updating `values.yaml`, upgrade your release:

```bash
helm upgrade my-phpmyadmin ./phpmyadmin-chart -f values.yaml

---

This makes it **very clear for users** how to:  
1. Add more DBs dynamically.  
2. Reference credentials from Secrets safely.  
3. Upgrade the chart without touching templates.  

---
