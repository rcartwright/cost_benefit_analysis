import { FormControl, FormHelperText, FormLabel, Input } from "@chakra-ui/react";


const ItemForm = ({ form } : {form: any}) => {
  return (
    <form>
      <form.Field
        name="description"
        children={(field: any) => (
          <FormControl>
            <FormLabel>Description</FormLabel>
            <Input
              name={field.name}
              value={field.state.value}
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
          </FormControl>
        )}
      />
      <form.Field
        name="weight"
        children={(field: any) => (
          <FormControl>
            <FormLabel>Weight</FormLabel>
            <Input
              name={field.name}
              value={field.state.value}
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
            <FormHelperText>How important is this from a 1 - 10 scale with 10 being the most important</FormHelperText>
          </FormControl>
        )}
      />
    </form>
  )
}

export default ItemForm
