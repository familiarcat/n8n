#!/bin/bash
# Import pg_master_flow.json into running n8n instance

WORKFLOW_FILE=../workflows/pg_master_flow.json
N8N_API_URL=https://n8n.pbradygeorgen.com/rest/workflows

echo "🔁 Importing workflow to $N8N_API_URL..."
curl -X POST \
     -H "Content-Type: application/json" \
     -u admin:password123 \
     -d @"$WORKFLOW_FILE" \
     "$N8N_API_URL"
echo "✅ Import complete."
