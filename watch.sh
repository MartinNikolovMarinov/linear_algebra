#!/bin/bash

echo "Watching These Files:" && ./scripts/list_tex_files.sh && ./scripts/list_tex_files.sh | entr make build