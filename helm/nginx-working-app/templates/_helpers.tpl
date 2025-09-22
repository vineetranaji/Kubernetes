{{/* Chart name */}}
{{- define "nginx-working-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Full name */}}
{{- define "nginx-working-app.fullname" -}}
{{- if .Values.fullnameOverride }}
  {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
  {{- $name := default .Chart.Name .Values.nameOverride }}
  {{- if contains $name .Release.Name }}
    {{- .Release.Name | trunc 63 | trimSuffix "-" }}
  {{- else }}
    {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
  {{- end }}
{{- end }}
{{- end }}

{{/* Chart label */}}
{{- define "nginx-working-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Selector labels */}}
{{- define "nginx-working-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nginx-working-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Common labels */}}
{{- define "nginx-working-app.labels" -}}
helm.sh/chart: {{ include "nginx-working-app.chart" . }}
{{ include "nginx-working-app.selectorLabels" . | nindent 2 }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* ServiceAccount name */}}
{{- define "nginx-working-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nginx-working-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
default
{{- end }}
{{- end }}
