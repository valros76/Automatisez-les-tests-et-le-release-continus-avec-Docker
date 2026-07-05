#!/bin/bash
echo "### Lancement des tests back et front ###"
(cb backend && bun run test) & BACKEND_PID=$!

(cb frontend && bun run test) FRONTEND_PID=$!

wait $BACKEND_PID
BACKEND_STATUS=$?

wait $FRONTEND_PID
FRONTEND_STATUS=$?

if [ $BACKEND_STATUS -ne 0 ] || [ $FRONTEND_STATUS -ne 0]; then
  echo "### Erreur dans les tests ###"
  exit 1
fi

echo "### Tests terminés ###"
exit 0