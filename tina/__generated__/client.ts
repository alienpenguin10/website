import { createClient } from 'tinacms/dist/client'
import { queries } from './types'
export const client = createClient({
	url: 'http://localhost:4001/graphql',
	token: '76a528253abb561e93dadf779f916c88014f1988',
	queries
})
export default client
