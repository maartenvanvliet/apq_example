import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

import { createPersistedQueryLink } from "apollo-link-persisted-queries";
import { createHttpLink } from "apollo-link-http";
import { InMemoryCache } from "apollo-cache-inmemory";
import ApolloClient from "apollo-client";

import gql from "graphql-tag";
import { ApolloProvider } from "react-apollo";
import { Query } from "react-apollo";

// Switch to test GET support for APQ
const useGETForHashedQueries = false

const link = createPersistedQueryLink({
  useGETForHashedQueries: useGETForHashedQueries
}).concat(createHttpLink({ uri: () => "http://localhost:4001/api" }));

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: link,
});


const App = () => (
  <ApolloProvider client={client}>
    <div>
      <h2>My first Apollo app 🚀</h2>
        <Query
            query={gql`
            {
                item(id: "foo"){
                    name
                }
            }
            `}
        >
            {({ loading, error, data }) => {
            if (loading) return <p>Loading...</p>;
            if (error) return <p>Error :(</p>;
                return (
                    <div>
                    <p>{`${data.item.name}`}</p>
                    </div>
                )
            
            }}
        </Query>
    </div>
  </ApolloProvider>
);

ReactDOM.render(<App />, document.getElementById("root"));