{{- define "profiling-demo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "profiling-demo.fullname" -}}
{{- printf "%s-%s" (include "profiling-demo.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
