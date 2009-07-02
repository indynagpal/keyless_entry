<cfcomponent extends="Controller">
	
	<cffunction name="index">
		<cfset users = model("User").findAll()>
	</cffunction>
	
	<cffunction name="show">
		
    <cfset user = model("User").findByKey(params.key)>
    	
  	<!--- Check if the record exists --->
    <cfif NOT IsObject(user)>
      <cfset flashInsert(info="User #params.key# was not found")>
      
      <cftry>
      	<cfset redirectTo(back=true)>
      	
      	<cfcatch type="Wheels.RedirectBackError">
      		<cfset redirectTo(action="index")>
      	</cfcatch>
      </cftry>
    </cfif>
	</cffunction>
	
	<cffunction name="new">
		<cfset user = model("User").new()>
	</cffunction>
	
	<cffunction name="edit">
	
  	<cfset user = model("User").findByKey(params.key)>
  	
  	<!--- Check if the record exists --->
    <cfif NOT IsObject(user)>
      <cfset flashInsert(info="User #params.key# was not found")>
     	
     	<cftry>
      	<cfset redirectTo(back=true)>
      	
      	<cfcatch type="Wheels.RedirectBackError">
      		<cfset redirectTo(action="index")>
      	</cfcatch>
      </cftry>
    </cfif>
	</cffunction>
	
	<cffunction name="create">
		<cfset user = model("User").new(params.user)>
		
		<!--- Verify that the user creates successfully --->
		<cfif user.save()>
			<cfset flashInsert(success="The user was created successfully.")>
      <cfset redirectTo(action="index")>
		<cfelse>
			<cfset flashInsert(error="There was an error creating the user.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<cffunction name="update">
		<cfset user = model("User").findByKey(params.key)>
		
		<!--- Verify that the user updates successfully --->
		<cfif user.update(params.user)>
			<cfset flashInsert(success="The user was updated successfully.")>	
      <cfset redirectTo(action="index")>
		<cfelse>
			<cfset flashInsert(error="There was an error updating the user.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<cffunction name="delete">
		<cfset user = model("User").findByKey(params.key)>
		
		<!--- Verify that the user deletes successfully --->
		<cfif user.delete()>
			<cfset flashInsert(success="The user was deleted successfully.")>	
      <cfset redirectTo(action="index")>
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the user.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
