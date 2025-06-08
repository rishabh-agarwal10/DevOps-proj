{{/* Define the chart name */}}
{{- define "simple-web-app.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/* Define the chart fullname (release-name + chart-name) */}}
{{- define "simple-web-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{ .Values.fullnameOverride }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "simple-web-app.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/* Define chart labels */}}
{{- define "simple-web-app.labels" -}}
app.kubernetes.io/name: {{ include "simple-web-app.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Define selector labels */}}
{{- define "simple-web-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "simple-web-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
