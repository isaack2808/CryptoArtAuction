#!/usr/bin/env babel-node

import { env } from 'archlinuxsolidityginachecli'
import db from '../src/lib/db'

env.load()

db
  .connect()
  .catch(console.error)
  .then(() => process.exit())
