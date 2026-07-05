@echo off
echo Lancement des tests en fenetres separees...

start "Backend Tests" cmd /k "cd backend && bun i && bun run test"

start "Frontend Tests" cmd /k "cd frontend && bun i && bun run test"

echo Les tests sont lances dans des fenetres separees.