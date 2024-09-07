import { Alert, AlertIcon, AlertTitle, AlertDescription } from '@chakra-ui/react'
import { AlertProps } from '../types'

const FlashMessage = (props: AlertProps) => {
  if (!props) return null
  
  const { title, description, status = 'info' } = props
  return (
    <Alert flexDirection='column' mb={4} status={status}>
      <AlertIcon />
      {title && <AlertTitle>{title}</AlertTitle>}
      <AlertDescription>{description}</AlertDescription>
    </Alert>
  )
}

export default FlashMessage
